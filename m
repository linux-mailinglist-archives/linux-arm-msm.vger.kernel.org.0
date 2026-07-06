Return-Path: <linux-arm-msm+bounces-116995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cOVONMgCTGqtegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:32:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A001714FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:32:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G48WVmSX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FWsQvRZZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF066345A741
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430B12459D1;
	Mon,  6 Jul 2026 18:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7C2F5313
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360822; cv=none; b=i9mRdh5FDLu2CLVIXMMd0xApEIFurhxtXJJS6k13QMKIptnpXvDQB4vXVNaKc0dsuUb8WkSvSqhXM21Fautzl6RJ1PakJIuqlaHWUWhkvHoVXDfAxPy+GK+N4l/MWwhRn/2pTGIl0CZckx/RxPZctXRFcp5xgqTbAXZ4l/01N30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360822; c=relaxed/simple;
	bh=JbvQKu3jFiiMJpfmWiYfkDJ6BdE8ppfjO1thakOUVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMb9r9H/xRHJcRmDSCup+Js5Km6t9vVWp67td8+A2e+C28qpsFItIJghu4xWWqGdRJRqwGzbT7tl8AmyhJ3QqgsHhvec7+nI3I7FlP6E3vIFUR4PiAzU+EpFRG1Y3W+PYW0umRI1dvmDk/shCNRyo8G8KkZR9dNPa5TujyO2f5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G48WVmSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWsQvRZZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFFO5809726
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1CGWMa1sF/4QzFpco6JpVT8
	kFVNcb1a0t7b6jTPoko=; b=G48WVmSX5lS7lRwJ90DC0HYcfrpir52E8QtA/PN4
	qGDamgNuAz1QGMUNOKuYT1XUc1h7Cby0EHf+x4HdebZoh7SVHqxg9Z8SbnrNDp3y
	O1JMvcqUxBuoLZB4tu9Nh/g1uyhA9p6UWECl7OV0tT0l7wu4X0D9bIkm2iXLyiqT
	2GYWRinUmFltBnZI0SZ+bDdlOIDO8k+YCq0GSHv8BteaLnhrKSC2MGuxo6iDIGTR
	PTq0TF+B6wkYG/4/0Z8jevt/Z7f3CEgsfOZUpppFh7Wsp97Pu6Dp4RtwGb140deA
	wxt2tqjy0tSIXKAx9wVEho3VBFM80etMf4mt0z4wrsgHHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsaq6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:00:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92158791d14so341437285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360819; x=1783965619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1CGWMa1sF/4QzFpco6JpVT8kFVNcb1a0t7b6jTPoko=;
        b=FWsQvRZZ7VRbWhtPBQv7uduriMtCf1za0oTsHb7qNk42djuHKAPbF8oa6gISiKws90
         eYAAP3E9s8V6Jtpei2mxzqOUuoNELL0gmuvW/R22n9Ycjf/pkY37eOCijWYKloKvAa9L
         0jTHmVwpR7EUQqSUSEXBa92PRyNbFWz1PUHYA8lhYNphB2D1HpFWdw3HbjUyN3oEB7y1
         P+VC7qyPgXU2Q1HiKoA3wajs7B8Bu0hPgcsGSzeibXVWwsn1sx6XDijz0s9Xq6oaP49I
         0JJb9ZX46WlPZTEjaez7Frd10chck7UN5him6+g2PP0zKFnEBiOnVV07tq+hR/8MSls7
         Vdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360819; x=1783965619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1CGWMa1sF/4QzFpco6JpVT8kFVNcb1a0t7b6jTPoko=;
        b=rK8M7+RbwBGPCktqXL6QDtonomo3DdEwdnFhVg40nb5BohRZQnmNHcA6cnldcVEnpB
         bYWT4lnTJ7ekIbRMptDVh1kjDeD5qCsmdDeMTOIOg1rSyH1uJTH8jdAazvAjxfCaQ403
         UD2dNbnSBVIHNrkrqKG1qtfNKidmNoIqNreNJUrw83gHw9twZJ3wvERemIGIwafHynzN
         DMzapknmbHn2GzApDPCWO7YbxgWS6elDps/HPTZbawcoKjlP461Lmtx5JzZm1ZR97Sah
         nEgkCZ4MnzeZ+6UMOOM1wIkgtySXtrZdHQvyHjLuyCiHpC7L8zAzV4nXINzVlhGU4hQP
         5xPw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+FO+9ZqghlAOtXod93Ju0BnZuvcW22xgc21nvjJ0VJUDY2Kcg4ln481XrrllxM8UNWyONLxme2M4DFDiq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08DF3+ttw36PG8VCeCr8FUzrHoGfyRDrRyNnrbrzr4p93az02
	tj0MoCrPf9cgs7n047gHYA3X0XKxZiUOeuCsU6wUbf+0HrvJIEpzrXSNdgCYE9xSRW3yKvPkfjp
	8ztCBRDhGz9lkg5uKw1DwI/JhBsJLiUlbLmnJ36vKGxWHviNM8NHey97ICYetBc7H6YCf
X-Gm-Gg: AfdE7cmr2LyhCTjlqj7gH/Uya7VB0kJuAtv9CohbGMDSRnPewSTesY79cp6fDqBIurO
	IHNt/l4Iw8Vz223LBnJwNDm0eLLu57SlaCvuQRNf8UIPgPJ9wRgmW0bxTVH/FK9QtUMBJW7Lm0E
	L7jrl9aVhSta9B8+9fHXCJRVkc4zXumj5SLRAVA3Y7UUqJ+NnjcSweOxuwVLj+4kll+oD79uahu
	6eVf372MR8gXmOUeQscV+6jwVUjtiYhLl37AS3QJZoZmXXhJFOMS9CLaUbLF+DXunSkjHViNEGf
	u3xEw6FdXmgbOBy/1yAWNu7AFKNaEu9x6UNUe5v/e4S13g81IAbuNi39DPCHT//hZCeXC5jOtas
	CTIG3kyfMlpYdjHSKrr4a4IbQzvpUuQnZ1RjMWMPcYNO4uiOUSJvmaoQwdYZUlNjLnVtm3Et/cR
	Z/ANySVxLm4tsqwQn2G/b+BXLB
X-Received: by 2002:a05:620a:6488:b0:922:a46:d9e3 with SMTP id af79cd13be357-92ebb534971mr215618785a.1.1783360818989;
        Mon, 06 Jul 2026 11:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:922:a46:d9e3 with SMTP id af79cd13be357-92ebb534971mr215608285a.1.1783360818403;
        Mon, 06 Jul 2026 11:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c38fasm3077629e87.67.2026.07.06.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:00:17 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:00:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/6] remoteproc: qcom: pas: Guard dtb metadata release
 with dtb_pas_id check
Message-ID: <ztp6pqmnge2yskxxinxpxi63eslwfv73wb3nd52yj6cdm6bknt@oibgffasssj5>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0ixaLXzEoKXdLNgEoX5tge4kbx-5wSkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX6Dde2cDQ65aP
 0UlP18kGJ96W42WoZ9+af9OIFMJfAYSXD5ruCjvpWXZRxsV7qvO0DnES6lwBo+8lBQSc3m16GaZ
 mMOzrfIfwRmjI7rkpusTlYB//c35zK5Iq0YbtJN5Ui5uM14yEHQt+MJe3W46TI8XUhO2aUDTu/N
 FnfRjMzIQI79zgCaUX0VQnwlJ/nk5z+Z9GyUTg5Q8CnvbjEyDhQFO/8KbhnReusHrTzyNlyVdBs
 cwWYIovIv1+2aZoWfoQMdzItobtiZT6QfIh9qmv030LojFIDDDccXeA3rt1Kg7mg4SSz8So4VB+
 9ZPciajIG9WvQCtRgJsZV2uwAnAdKmPpn+TS78MBBHtSDUuoKbr3uVsnHzImVdhWBNDvJYFMJO9
 UpoPVN5xKz8wVo+1ElkAYOeq1lpdcRn22UK6Z3FSjxuNPjVq0/oYrM11NbvqPhiGp59kr1JVID4
 Wc7WWHMbSWoANNk5GSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX5upcMvjqBL7K
 1kjm3MTLZr+REeYVHaR3tWZLHmyqmChBoVJBwblN7s+rFzZBFpRhmfRJODe2QR4Amhr8QTaxSq+
 cET1jP/un2AIuV9smN/EArdrmHJwkz8=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bed33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RnWc8x33OkAxSZZ7CTEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0ixaLXzEoKXdLNgEoX5tge4kbx-5wSkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060181
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A001714FC8

On Fri, May 01, 2026 at 12:42:49AM +0530, Mukesh Ojha wrote:
> All other call sites of qcom_scm_pas_metadata_release() for the DTB
> context are guarded by a check on pas->dtb_pas_id, but the call inside
> qcom_pas_load() was not. Fix this by moving the call to the guarded
> block.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

