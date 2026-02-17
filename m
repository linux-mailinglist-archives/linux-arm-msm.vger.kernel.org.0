Return-Path: <linux-arm-msm+bounces-93114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAM7LNNFlGmcBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:41:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589A14AF4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A84CD3020ECE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C914C326957;
	Tue, 17 Feb 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ns42n+kH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh7NtR7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF232694F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324864; cv=pass; b=qT/q5BF2z7PKFbR6ftridVnw+W2mH0xm4Zne8UcSzPmUOFIAae9mZzaQig9Du0+agf13AiMV0wnKblVnIh+8pujfbn545t1+7gxuCIHkQ76VHqKXpmlFEPZ+cHNwyx0A4ewtNzvLK46PnP7AsJn9qabiWN5/p3Cn1R8wEnh0LZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324864; c=relaxed/simple;
	bh=jvW4MfiEoqcUVdeGjY3STnQGR7tHII8S4Aq0pNbP9LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMOFcjlWmzPzrx3J7Nn+PHEFfoh6Bvgqq47iTLOsMqaESyQRjhXochYBTV+chau+39L+WotTjljNMVEm9cmzgRYwlpUtAZX3uWWGz1zg0tuIzSafBlHJr5QHUTtU/hPZbao2sOyEbS+AtwZoXiLH914+LX47+gRN8RaCZInEpx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ns42n+kH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh7NtR7M; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNunRF1935465
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jvW4MfiEoqcUVdeGjY3STnQGR7tHII8S4Aq0pNbP9LU=; b=Ns42n+kHfsTljtyw
	fCRQQLlXRan4kUVA7HaWKlKOZIV1zVdKTZM0upUawxNMRwLK9l+BNpNtalzPVuHq
	NtX0cH0tHJJOE70JR8Wf/EaWKC/l9TcI0Ec5PI49YAT+Qv+w5+XfZluIkifVDh7Q
	0msU1DEBhVcXbaM5Y9LZ/8XetRLl4N5dHh84KLskG1qeuyQ4zYGd7+WcxiCf61jW
	A8hRx0oAK6Uv4/PgDFb8dwHHZls7B8tw6YVqYvW4KQhr31QhJAOHYUE3onC/LTk7
	TT+/4T7oj1C9fBZx6iz8IY6ne1kDlqqktT47CZ9cPZgnnCYLhNV+TEzgxe5C64zZ
	eU20eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662t19d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:41:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso3316241485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771324862; cv=none;
        d=google.com; s=arc-20240605;
        b=PEr+b+Ra0z9HN9ZaQQOR66xSilK86kAiBf3fW5ZzMSAzjqNxJgixdMNG//UCu3u0RL
         JeEKWZ3zarOU094Xg2GJTkhvZ4AFYB50JvKehadMF8GbrsBLGIftolGZvksQ574S5iRZ
         qI/lNACh3j4jz/37H7cJisriR2k9TywPgAHuHO4UhDnMX/Mk/oE3lBUiW3XR3MT+gk2U
         w6TvcTRPx7ct6XDu7z2YKLyl/ry/WRF04yaJ/M4QIcAJF3OBYJawn2cRYtjn9mbC9eKL
         O8iP09l0vt3MTecjMx40MGXfO4nov7oa5HsQYUSrseCeouS34CTrtTZrKJAcp0eLEVkL
         eqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jvW4MfiEoqcUVdeGjY3STnQGR7tHII8S4Aq0pNbP9LU=;
        fh=VSX3nxbGhw9+Neaw/hzInGkS6JveWsoQ1n3OuqNOsoA=;
        b=Uv2vUifVLZLhfDp5ZASh0skHy1uGEvL/d5/ERkehutoquPvTKvMaXKN/Fvr1zivPrp
         2A/98lNTfwtkLvRqUOd60XElZ9aMvTmpos34S9OHO/0JDBpMMLfG6crDldWemimnQGaP
         hXSFJClKb9YOZA3B7PpOmc3ciX5ZFYTKleb5UzyHpj0JWZy8RMQ759MxlyBQkYIOUG+2
         V5GHBJLlswzt1yiyRopId1vjG0cnv8TxI3aBHNne5j/xYhctD5bTeRWd+TMv5EEQGe8+
         t7pmQIJX8FHlxgL4yHKM2qToUuIN0bw9wx91GoO//kzM0gotBFRyTPWjSdaBC116Lq9e
         wHXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771324862; x=1771929662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvW4MfiEoqcUVdeGjY3STnQGR7tHII8S4Aq0pNbP9LU=;
        b=Wh7NtR7MOZyYS/AhxekFbJL/uxOZi+os83vUEfIs3oIzepeMuAnCuKy6ZDBEPp6utm
         3NRJpeBOwn/pFM9IZfa99Mig8y7fGZy4ISLTCaZ9o5A2XdfSfQucPPNWTKuP92xQ/3xI
         c8bTIrD3v4MJ3Z//4FFL+1qKhZ3Lw6ksYxlj3eD+jWTk/y2UWFmX25QSo5nf5DJF+jFR
         IiRvSBxhACwIvxnSJ9iUD093LWfK3FqWdk82tfilCxNZmjgHCGLxFRvYBM8Run1W+4qx
         PHspmQDw6zEbfrOaCtFELkZuU2mws9T2Zth9UqT0GzTdGoOpjLl2wDU4ek5814ZQ6blR
         vPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324862; x=1771929662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvW4MfiEoqcUVdeGjY3STnQGR7tHII8S4Aq0pNbP9LU=;
        b=kHM4bAtOvF4NPs7/pSW2lzmXGDzhIrHtJ0vXoLBiQXBPvtE8kDlM1ZVFt78RayGLW/
         8IS2jLmFhhtQgTcF64GRUk7zVdRO2/9zZucmTvFuXCWmN1amTbU8UcOqjlbRQAO53WK4
         xjk7rXmtIDqRenNWlBhkuKR8I3iF3OFvjyJN9SJ7Rqgized/x09txnfOTE3/8yfQ/reh
         JU8onULSi30ZWzbnUI2GJGpWFQgVptjTvVI2KILfEsJ78lrJe+twcyvXkfN8Qf8iwMvB
         Rzgqvpvvdw7+rgD9gNW3uq3Okh4d1aLZ+5z+3GsftuTqPzdJ8CSwV8NyIZ6a466JB8mw
         /5KA==
X-Forwarded-Encrypted: i=1; AJvYcCVDuc5huQoqdXN+zmI+8J79cCR15nLPzdJJX4FETfIU4B5TGPhyfRs7hUs+/5hKxUNL0nkhEyjwxuziUmOv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsEupGmDOroO4klKyojYeTksuEOFH2S61mdC1San4bTD+IXIM
	DFBeM95BanlSleXvJbg8d2R0kXN/Mff9TY76mXuLew4sASIXwnydJSeD1I4GtCNPxYexUTZFTjf
	HCaNovG0o4UnDJzjvpdKeEiktAANCri69sZ+1w9n07t5RGRutGNUHkwYdSbpsTEDAwxIZ2lsIou
	ls+WyyA9k+dR5AtCJBpepWt626gYJv9OE2WS/jPadK5yM=
X-Gm-Gg: AZuq6aLTbN4JhEtTN5A2TJtipNn6OFQ/awPHxaqYfr+IccPe7PWie55ss16TpmvibbL
	GE2EUCGEleBCufD90bzMQj7bmbJbjUEvj3uxPxLsYLaa9iFw+Bu2A9zYM36aRoIfCDtypMKo9R/
	I2XDwXmS4Nsu5hpLBRZNjOwwRAgC63ffqsOpQjYtup7L89zek7ypXq7aSk7d5KnuVwO2D05FtLp
	lZCNJv5bXahpwI4MHErwWNP9xcBr0sqOlXMH/w=
X-Received: by 2002:a05:620a:2683:b0:8cb:39e0:1710 with SMTP id af79cd13be357-8cb4bff2b57mr1321677385a.54.1771324861843;
        Tue, 17 Feb 2026 02:41:01 -0800 (PST)
X-Received: by 2002:a05:620a:2683:b0:8cb:39e0:1710 with SMTP id
 af79cd13be357-8cb4bff2b57mr1321676185a.54.1771324861516; Tue, 17 Feb 2026
 02:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com> <aY7pvakkOnaYsd5p@hovoldconsulting.com>
 <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
 <aY8Asvu-1u0e02oJ@hovoldconsulting.com> <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
 <20260213201550.vk5cosmoewokarlx@skbuf> <aZL12oyiLumpf39e@hovoldconsulting.com>
In-Reply-To: <aZL12oyiLumpf39e@hovoldconsulting.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:40:50 +0100
X-Gm-Features: AaiRm51hdbGztObdC541hjPZzX1mYaenKfzwcLtfRh4FjIoMnwsHXszFXK_xCQg
Message-ID: <CAFEp6-0s9RtHWv6eRUM68OPE11x3NuY_s9PPmvs7piBijvkL2Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
To: Johan Hovold <johan@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, vkoul@kernel.org, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4OSBTYWx0ZWRfX8IvGgZTGCjYZ
 kSpDInRGZQfb3ijYx6UvMRaOp4RWgjdvJHe4kTNHrZtrbKO54a2+tFYhQWnLn158YzpqsZmwV7f
 4Zy9g/11I3MCWVlLzot9jEsX3jW68D2aKaYRNlZ1tQ3CWtjP5z1AWjmgFP9QCVH0hrTPQz60ZK5
 n0cx/mDC/fyHV9j7gYX7U+U3MPYohk1BDJj3pRlTF5E61dQw+k64SxdPXLwFdx5AoFXuL5ePTMn
 FGT4IXfIECSwLevZiuGO38OFhDNMmqlSW4lV7sV/FFW71rXmvZfvvy78wbb80xOYKUWZrEaz0Bb
 Lbct2OaVaiBvdljBlcTiLpt7M0BGudzsQxWu/FBkSqSpzmjvzv3jzqqXKW3Kq6BIcVG0oUXpW3j
 VtX7UaCfqhnRMTMxkYVjgn3Ruj137i696JoRwUeOYY9sVdZh702XptPLlZlJ6HxX0zlzvxHRViF
 2CS+RPrjH6qDYTSoh8Q==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=699445be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=frQsgQOtNAQVVFUjO-EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TkV7CSYL8CHL6-gmx2NySuqXSA0yQasN
X-Proofpoint-ORIG-GUID: TkV7CSYL8CHL6-gmx2NySuqXSA0yQasN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-93114-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3589A14AF4C
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 11:48=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Fri, Feb 13, 2026 at 10:15:50PM +0200, Vladimir Oltean wrote:
>
> > Another comment upon reviewing this driver's runtime PM use (although
> > this is at most something that may result in a patch for "next"):
> >
> > This driver uses hsphy->phy_initialized to make sure qcom_snps_hsphy_su=
spend()
> > isn't called unless qcom_snps_hsphy_init() was called.
> >
> > Don't we achieve the same behaviour by replacing "hsphy->phy_initialize=
d =3D true"
> > with pm_runtime_get_sync(dev) and "hsphy->phy_initialized =3D false" wi=
th
> > pm_runtime_put(dev)?
>
> No, the device can still suspend before phy_init() is called.
>
> What would work, and which should probably be preferred over adding
> these phy_initialized flags, is to increment the pm usage counter before
> enabling runtime pm and decrementing it after the PHY has been created.

Ok, yes, using the usual pm_runtime_get_noresume() before enabling
runtime PM would work as well. This is conceptually similar to this
change, which instead relies on pm_runtime_forbid(). However, I agree
that forbid provides no guarantee about when runtime PM may be
re-enabled by a user...

Regards,
Loic

