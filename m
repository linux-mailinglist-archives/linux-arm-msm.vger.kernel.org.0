Return-Path: <linux-arm-msm+bounces-117328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5PfPMokBTWp/tQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:39:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8371C03F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:39:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=klrc312T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZT3Pok1R;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117328-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117328-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E570E317A75F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47EB417377;
	Tue,  7 Jul 2026 13:33:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130441D4FF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:33:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431186; cv=none; b=eaZPgC2Rd6EiR+g00XI2CRje0AzaW4JUEYywPU9WD/ExawVq9/sRvdEGzlqL3tCrug3k7VVKzpkNmE0vawgXHZPaxhc5rIl2iFOYj/YnZTVJlAZWgOzR/PaYv7ef2XE0iX2BJBZwxZ9pZewLRD03J90NPsdMoLXrHL+tgfnnCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431186; c=relaxed/simple;
	bh=QW66NHVTI6Oj4WQFVixJ8XidASn4HkchNXi+aEftbi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSpHnbCygfvbUJfVH0u2uX6erVSuI14FBS2zS3mWEPwkeBtZOHYpkt06+oVGiAkgKLWUSK8rkunCTbzpX7CfRv3otR1+bvRK+nmx/GTzw/5/pR5YSVnlGzNARiVYZO6s9r254Cim6qBP2YGEUkDBrUNvDEka02OutCBDJNzRqDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klrc312T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT3Pok1R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8s3N3676438
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFefM7BuRRk3FDn8aw0Ky5+cc0k1y191ixtbbp19Gbs=; b=klrc312TR6JIkbNg
	Kvp30MhZqDGDUr6Cok7o00LHV3rlEZC9UCRzbvKZrZydQftcN7J0BsOrtuH57MJ8
	HahYCLaEYo3j7595ExWHyVzujZs0fQ+TkEhESevi0vJcAe6mcYy/WcwuyWKrVCSa
	0uSYlbu2RBb0a6Y0B6athDDTcjuir1E2J5Trehoq+CcvAXOBdCMZ/RuPievSJ4Vd
	V512xfl2j6L78TLo/zB9WEHo18yFvz+cZaU+l8YNmI1MfstyWlMOal3pQsXTspob
	Ox67rUaZywidb7qehmxNKj3aiBAuI+tp9546cHbUEQl/SMSw0YVesCTCIf9jJfVJ
	TV4Bmg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15a6wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:33:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7395c3d6923so1126153137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431183; x=1784035983; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFefM7BuRRk3FDn8aw0Ky5+cc0k1y191ixtbbp19Gbs=;
        b=ZT3Pok1R63GBz4eHdlAN8+7z6foeSWqfuDeWBJ4cWKrfJ4OdI6sOXtj7Hkujd+PAQi
         UoH5xxi1Sfqb/sbHuTh3nwgw970AIpfYDyaQczLjKe6mAONBb5v6scUJ2mEcaDprNCXi
         Fh4iY0pRvSxDJFpKrCfmeluecZekVDkZHNZRUyK+5SgIUEYIDxLdyvCeDQTVId0uB5rx
         flzZWFTa/kXDHaYpVl18SygEaXKgXV42gmWQeYcxhVpQ48K4BYGtMoodyZlCy4uI9FQ5
         q6gTjkZLDJfJmiSwtMk3ZYurW6lCZ/lvTrMFfCll6f/+gIGlW6Kqatseu/35DuMZVtDR
         2fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431183; x=1784035983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tFefM7BuRRk3FDn8aw0Ky5+cc0k1y191ixtbbp19Gbs=;
        b=RLEkNzeQV5TZ9nGbnN6mak5+9xJukGtbi/81fwA8kmkx/Nd2bDrAnB+/W5I+4dnlyT
         H8K/5sPPBH9wzpagojNGfjO5q1v+LJ5VGBPei+0qwT15L/REA2IeWysKwrLyIMkFVlPL
         5SjG4JUtA9EbW0PQlXHs/kaG7olfmldKYXNxUsKjKP2++zpfeDXmsj/2DY9+O3+ekk1g
         YpVy/APjwioYFrknX1SmOxWUwah186oydDSxxcn9EHsEsUol7NNycVBDRKsppOrV7i0S
         oo4Pp+OFO2KyrqCMGdmVQTwtEoXnTQToD1S86ftSEkE4BqEBjQYsR51nZqKUfBf+h/yl
         qzgw==
X-Forwarded-Encrypted: i=1; AHgh+Rp93uFCPZ8f9uQJZXaBnlwuvsY7bOdtitzd4+5lX0K0Q2K5u/+c5UZtPBEs5Zy9v4pfKXkaOrQ6g1OHeOcj@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNp5Qfcp9fgHrEZBF3+RQambEqTcG8lvzozFc8dKAi7njysEE
	pD6CYaaAcmtMySJ2bFB9VD4lftmumi6+/IWeomYpJP0kAtIb9OiFcjhEXIAKb3loyPKKyJckZyg
	rrmCCikqWQpvlrsTRrG3E/To5AP+PkThfiBVIU8vFOrqvy1XOexi+Gkxu83kqEMn4U56x
X-Gm-Gg: AfdE7clX0M4oGn+ggWwtQ9UMOL8i0U28prAo3PWt/FORTARU5OkCdWADnUIJd6q5rzI
	gG3PCQDHa+p4YOq6XbUD/15+hhHCCBkMC0C5i4+BMlvcbwR8qvx4x1928oM3m20sFk0XyYD9j9j
	jDV+zeRs9O8zjKpqcLFl5P7vETfsvkHSvQMS3649vtpFu37/ur+u3I42uO2Ts65+2RNOPH7tj8F
	vAIMBD8ok2jJ1aJNDG0r3c5gkyryNrgoFXa41h2UYGPqzj65NSn9FsNIAchSlFuSsA6mRnbB2O7
	LLK+W86x213AcjwsE6W/mCmmLtLpBWoWZ0fr02We2rJPQebp6DE22E5+Eqz+YhyvcArQtZltBRn
	aO3yp4EpfLHGaJaWrAO+lw9V/ZV+3/PIsu7Xi8lvVal+Wsx5djm70j+TeU5l2jw7NXSjUDCINLt
	z3yh6xXSyxNW4gCrhAywPkzviM
X-Received: by 2002:a05:6102:41a7:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744b7dacf37mr2764679137.19.1783431182764;
        Tue, 07 Jul 2026 06:33:02 -0700 (PDT)
X-Received: by 2002:a05:6102:41a7:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744b7dacf37mr2764645137.19.1783431182172;
        Tue, 07 Jul 2026 06:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8b5bsm3805297e87.80.2026.07.07.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:33:00 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
X-Proofpoint-GUID: niBM09Bx9sY2idCAypdP8kMOt5MRWpXx
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4d000f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ahtVEZUH5jVL-0juYUwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: niBM09Bx9sY2idCAypdP8kMOt5MRWpXx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX9Uiz0fH2ebXK
 TW/8bMxRA/Co4GBDagyA4SwY6z2JdRKs0dHc1KlKBegcVgg4kQciqFJQeCFhYmoP380Ix5GaJpc
 yg/UXcZpsONseFuE7gzOHIEMeqsTh5g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXxWm2WhWzAtsw
 6cKEl6uk00rP1yW/1gcEzxoRj7RPp1EmqnN3EJ3zrUezw3dfJyZHUeH/SxNBJbHFxjfj6B7N+o1
 vW0YUNieCWwJz70y7kUmfJgayhAnMVG0BnBcCT45tsA6suqU8VqLycDrujHGDKERuRVZwf2Jyib
 CAOZwmhWbS1TfXeW4c5Qi0gIpXP3yX2l5K+HiI9wv3qZwTFobKG6ZytIigocI/T4i5AcJ+YCY3j
 HBKIyN/a6IGo+pzFAXyRCBRa7RXWrYKCkHWk32WTX5I9WLZp/rwY+wxAXPpexUR4dpOl7r+cwtL
 zMJnojByVSi2Rooi3mjZVFSpL81QmddCrBuM2JG9DhmHIg30RWZRacraWxt8siiJ/1qi5cOBSwd
 vr5doDWUpMD8rchv/lmNp5vkI/bro+6GQaYAIy4V66747GwQoAZ6kX3ysfCyrGeHqjL06o9KnW/
 wIf5If8QD76f9XHP0wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117328-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CE8371C03F

On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad,
> 
> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> <snip>
> > > 
> > > +            interconnects = <&gem_noc MASTER_AMPSS_M0
> > > QCOM_ICC_TAG_ACTIVE_ONLY
> > > +                             &config_noc SLAVE_CAMERA_CFG
> > > QCOM_ICC_TAG_ACTIVE_ONLY>,
> > > +                            <&mmss_noc MASTER_CAMNOC_HF
> > > QCOM_ICC_TAG_ALWAYS
> > > +                             &mc_virt SLAVE_EBI_CH0
> > > QCOM_ICC_TAG_ALWAYS>,
> > > +                            <&mmss_noc MASTER_CAMNOC_SF
> > > QCOM_ICC_TAG_ALWAYS
> > > +                             &mc_virt SLAVE_EBI_CH0
> > > QCOM_ICC_TAG_ALWAYS>;
> > > +            interconnect-names = "cpu-cfg",
> > > +                                 "hf-mnoc",
> > > +                                 "sf-mnoc";
> > 
> > This is the topic, which may raise a disagreement, but I'll repeat my
> > position about the need to remove all "CAMSS bus" specific resources from
> > the device node, they are found and should be allocated on parent's side.
> 
> The interconnect has functionality to handle bw requests from different
> clients.
> 
> Yes the best will be to have camss interconnect, so jpeg and other hw's to
> vote
> 
> on that (actually it is possible in icc framework) but what is the benefit
> of moving
> 
> those to camss? Is it not better to create camss icc. I understand

Please fix your email client and stop inserting extra empty lines.

> 
> you want them to be on parent side. But how to vote on bw? Most of the time
> it

If the driver actually votes on those, I think, it should be fine. This
patchset seemed to add bandwidth voting, but then it dropped all the
votes in the last commit.

> 
> depends on the jpeg encoder configuration based on resolution format etc. to
> set properly average bw.
> 
> So i dont see how that can be done with not explicit dependency on jpeg with
> camss and some exported
> 
> API's which we discussed with Bryan they are preferable.

Interconnects should be fine to be referenced here. Especially, if JPEG
has its own port to those busses (hint, commit message).

As I wrote, I see a bigger issue with the clocks. You need to have some
API to vote on them (and then let camss driver aggregate those votes in
a platform-specific manner).

> 
> Maybe i do not understand properly the proposal but can you just add some
> pseudo code
> 
> how you see the things?
> 
> Regards,
> 
> ~Gjorgji
> 

-- 
With best wishes
Dmitry

