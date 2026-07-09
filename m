Return-Path: <linux-arm-msm+bounces-118028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nDmhChyoT2pzlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:54:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA80731D25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:54:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F9Hch3o4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X7ve4I0I;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118028-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118028-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 129D1313ADDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3CD328635;
	Thu,  9 Jul 2026 13:42:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE290326941
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604573; cv=none; b=S5KWjejfimEltoFRI1tE4ilHlLUSAjnvWhaSEKhqBrfNy2vF7BQLvGipskRK5NTClqLiUfJjCE9wuj1vC2NfkhjAFcvQpmeJxoqbMRuo4W/5J5JTmzyN0RY3bAVdN2gikjAo3jKVaWiPUnJPB9ebiMvJcCLb/rjgkWLY9gJEdvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604573; c=relaxed/simple;
	bh=Gg4niW8kVv3b3g7jDE+c+5OksWid4lupNeBKdemEzvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOayrRTe+H9lPaXvlS26r+whwDv2tMKPq7TU41x+/H7y/kCO+ucI/iOXmPys7KekimnogvjsU/dzcP5JQn1V2W41VsvujS/J7CHsyjXKbHka0QGc0wHUDo0vRHvswUR76sKL7r7DEUltiZstUnk+BqU/CqsNOVDYMQ62YeI/WLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9Hch3o4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7ve4I0I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DdiSm1930372
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=; b=F9Hch3o4T7NJsf1P
	wYr85a/DCvN6Lk4nLUGhMp6PTQ8FGNyRBL4yiBFkchly0uHRxjitwucI7vHbO41Q
	tJnar2UtGCxsFj+B9TnV3UlOd8lNnGyad1xFdI9HqkhQGq1dnAAE75yCjkndoECa
	R4gcK36CkRDIXEBDX1V7M1Han+SiynAuFBVvkiZwvIWLJuLueTQRYwWZH1yDT+z2
	4fLwJINlvXvRhk4t6gZnB0o7DCb9bUdfxln07nk7QowDBzRE+SHAg+wyvCC9DSbz
	Mmq2P3Ufltc2M6WYNQiyUmUJ/CIbHY6mcohhCoLsG2pqULDA3YRb2fhaUH9vjLSW
	DbQShQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg0cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so3475959a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604570; x=1784209370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=;
        b=X7ve4I0IczmXIz4pogUOghKS9qyZaLIfkZ+VEa8uep+AjbWe8YhFk6vGqlcjM2fGx8
         1obN7x3/nwQB1Uka0QoJMWZBpPxT9OWEY+OxTflNYMYMGY2WsPUPkWbcdcAsh+RwOjv2
         iVFwubz9byKWl1yGpfLhy6YGE0rZEghNbfLJM8pmPov7EUZAc+9wctkMFqf+x8z9bOOk
         YWXx1oYIcqZyNWR70KNO3GL2QIbomq4DNsbfWhbuHAxB3RzO0RRwV0AmSccyZ1QRD/bR
         yht8FHHvvPKPZMPoxi1Rdki1xc8Gg21IEqyskDOEIWz6DM2ERSYFJHmts7IQ5DKPFczv
         gmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604570; x=1784209370;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=;
        b=eUXydhPR1Dt5IiZVxVOKB1Z4lP8paBoGuzBjYN8NBvPsXu9Fry7cxc6GbCPexmKhoP
         Dihs38V0nwr6ujAkmzPBnE6gDTIk2AwognYgzhxVgqiQK+Or0yNR+VWTKeX94W1ChAz4
         Zo8k3ByxycsGq+EhXpG4maIF0rUKNf6gtrmSXLCIE5dZ5MLo3MY+IClm6MZhqCUHdXIj
         xWJEMaKo4bS8XTWJcZBl0Uxs+ILyRfTgo9FH++3DAJtJ0f9LAb8uXQeimz7NbA49codc
         jlGGNWYu77ZtlgrXw8qp+mCTAsphmD4hwEKyiHaJ/J8gxkCRikWTa/nMMB/08j5dpwO+
         HYVA==
X-Forwarded-Encrypted: i=1; AHgh+RqyoMvwI/FfweSGWY8sK/dKrlAq7fSVWqGvUFnsSj4R+ups48TFauZGpkCj9gwzaaWA14QAcj8p6KZF6lHI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2niZafkDc1k/krsBGwoP+WjOt2q12E6viRgSY2g7LE+dcJEv
	KwBQxXdvrjq76IYgbFLv/2xUxrj/CVJNxUmb0/o3xTcHKXLZa0Vxik3RX58f3yibaPlX1YhOF6z
	Pab/IkowH07Pqvg0BZDZqneZRkf/77poc7TBmaYR/lAOWDdmNAVeGT62v3SkwMUor3pXR
X-Gm-Gg: AfdE7clHIu/xm5UZrHcIJIqn7imjOTimS2ZefMPop6ar5mnKaOlv+ElwmQoC0ebMpVD
	0FsUrkE1Iys1OUzDk7YNVPxgmcErXx0ht9d9wRJQqeSwzpIWPQIFoqA2R+KWkdK592JWzyF5Rm1
	sHOO0QU4yROCvUdKfz2I/7Nbck3+oLKfft5GOGhcNKiiuyzwIow8R0hk1pv4H160UTZUjeEN4B7
	SNqiJ1SS1IiqLclAByOrtC/9o5cVh+TY23/OKSB+BDgxd+iUcf6YXSJoz0eSU65Qtn1e6EF8YOf
	3J28KQh85OqbtKQp5qDKU4F14ANEiv/VCsFB0ZQFzdWfGvrgfmCFo//zG4Vm0yXfGpdWH2yJWNw
	GlMiLGrj5vLNfRQeUe8G97OGIBbk86z+BuFk=
X-Received: by 2002:a17:90b:2d91:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38941102108mr6904994a91.3.1783604569736;
        Thu, 09 Jul 2026 06:42:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2d91:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38941102108mr6904955a91.3.1783604569291;
        Thu, 09 Jul 2026 06:42:49 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm32820196eec.13.2026.07.09.06.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:42:48 -0700 (PDT)
Message-ID: <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:12:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX1AwCM+Ye/yAu
 tlhGMwwXOhn1tvu17zqC9Unavo02ehznETW1n/gsX6uAGtot1NytziwimIADSRBCaJSsTYASHu0
 qp9yC2XfyKiNpC4ZtWA84DQAmbGN8zQB2Na2hG2UXe5n6fk0aMRa/etIR/a5xBhI4Jp+CvgLDvI
 NNkjrguBAf+nOupDs6qc1XOpnPzH7/p+9v3d3snXTfOst+pLuJGnH6GI8mH007n7TUGY8/rj8zo
 mLC1t5fF+5Tlo+LZieKLS7o42uPdjX0g0Xba3FcQaEOYECwibB4EJ05aODZl6Zym1ZIsGfJnCqF
 HRRb3p5o9KFC9KqdVUNk5fm5THAbQpkpguCMgZunVH89wjU3UwH/QAuVHwAGPYY3PaW97CZtsHu
 aJna2SW2hl/G3uuoVWt2W1Oli5zxQ+4sW80OGTOC76vUW/zwXscpcW/HF5BOnw21w8NTKAjpqKP
 j4QQZQ0R2uRc3YbZNPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX/BfXhjOscuVg
 hl4hJCDMH6MmtTuhhwtwNwzmBXcX8OtmEXuOss43el/9pE21Cdw0exA9CU9nk5Qgo/EIk+8NsIn
 UHtUi0StnqNHfCdkGcJji3JeQ45MkfU=
X-Proofpoint-GUID: Cb_TbmVKiDsG2SX_19SSTGBhJorNpRn3
X-Proofpoint-ORIG-GUID: Cb_TbmVKiDsG2SX_19SSTGBhJorNpRn3
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fa55a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=pGLkceISAAAA:8 a=mritAz9d6wIG9kTKuDcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118028-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FA80731D25

On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>> In order to associate the SID used by LPAC to it's own domain and
>>>> context bank we need a separate node on the DTS.
>>> Can we use iommu-map instead of adding a new device using the same
>>> addresses? You provide zero explanations, but it seems like you are
>>> trying to separate a part of the GPU into a separate device, but it's
>>> unnecessary.
>>
>> What I was trying to say is that we need to map sid0 and sid1 to different
>> context banks.
>>
>> From what I recall, so long as we use the same dt node, the iommu drivert
>> provides no way of doing this.
>>
>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>> and secure.
>>
>> The address on the lpac device doesn't really matter. I have very limted
>> knowledge of DTSs but I think we could just leave it out altogether?
> 
> I think, you were poined to the Glymur Iris patches. Another option is
> the QDA driver being submitted too. Both ot them use iommu-map to
> describe the same usecase - a set of SIDs which are used by the device
> but which should not be a part of the defaut set. With it in place you
> don't need to have separate qcom,lpac devices, no additional properties,
> etc. 
> 
> I'd recommend following the same approach.

iiuc, the conclusion in this recent thread is to use child nodes for a
similar case:
https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/

-Akhil

> 
>>
>>>
>>>> Add the code to look up that node on initialization.
>>>>
>>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>>>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>>>
>>
>> Best regards,
>> -- 
>> Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>
> 


