Return-Path: <linux-arm-msm+bounces-97891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKQkKL/Xt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:13:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D857297BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51D51302BDD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCE437B03A;
	Mon, 16 Mar 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDh2WZx/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsYPscjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1E934EF17
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773655687; cv=none; b=H9J9wy0ChVDxjFpTerWXV1TdEOH+ZOZB5kBbpsUY5MY6MeLer6g7O4bfTAAnkO98m0b+K65h/e85AdTkKHaRj10XfAjhBllcQHi6MzWB6A4GPv3I6++9NRBLG4zVRDbqaGq44ga7dU0zzGqYAd/6sZIzUZaq3ZDHndIkRSsem8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773655687; c=relaxed/simple;
	bh=udC/GqyllmqetDayCChsqG/dwbY35kRsxF+Hq6XzcB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwzBy9jg/7ki78U43/mZCzdn8i3kbJZSHpZt2zD66gc9pdsT1wY8XO4PWqA3vC3hkuj5tkUhpPYVm4r34JEMkW2/b3K9sz/FxY1STLpNZm969FrTbI4q/UMpbYjxOpVkB2Ji7BfrF30DUC91au0f5gP1QR0dKr3L2ulHCFAs+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDh2WZx/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsYPscjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64mPH323708
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCKxTdgkdhUfhMWVS3bqu1wMEwzKvP/Qe5TgTlQaWwI=; b=NDh2WZx/rg9oCG3+
	rKpsQ9IW5iKg3abY7aAEIGITLM0KxtNekaJQVZz2ueZUyGBfNTaj0KSme3ZBLXkv
	asbB/C8OMNZD/zYenZLU26hULxRUQErIb0MZQ4KZ4RokZ4OFx31KISOJrmxy7w9d
	5eawRa0ZpdhJzV9JGifJhVXfm7RhqorehiG7mbSbBlycAASZUa0pdS98GU5QOurC
	+kIROciR7fgvKUDSJBQ1QEPwzJdS3/sT515te7IxXBqXyAEd9HncdNQ1VbRktmmJ
	TTT6BZ7fexIhtNVV/1j9uz2XvGQUy2KElp1INJCT8QVPgMef7oWYOfZpIrv7c/HE
	AsGJRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qn96e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:08:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso279819385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773655684; x=1774260484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCKxTdgkdhUfhMWVS3bqu1wMEwzKvP/Qe5TgTlQaWwI=;
        b=IsYPscjGlO5hQ5TLMbEvT1lgao64CGXjuswV0hRVDqzWTtCgpIioDjlDzUFHA3iRW7
         FFebZTi6S9HfFX/qdhhwgumVMDtnwizDvw8mJy5G1Mh+4XHk6UVGV3mwb4l/Kj1oKBWy
         5AZL80GFwaRbqR13fyLUIo12Wkye35uYO8bxXVgVPx9R7b6a22rTq/3xKlJ61FFSeQO0
         MAa6WWu9Man4RLmZ4LiRf8UrXM69Rb4yLihV57ruLmupN/hr2zxOCPa9yWwDFK6xCxqh
         RFrGZQpBdO+0DGbePOOZnW8n+gxCLZkDZ0bM/xLXz205k4WqYFjKUxjANllvcbxXTkUj
         ddPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773655684; x=1774260484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCKxTdgkdhUfhMWVS3bqu1wMEwzKvP/Qe5TgTlQaWwI=;
        b=Hc7VlnD+5eSk35OrKKmG801kx2kmeOzxe1x9jjLGR+IxpYsbnrw/4tn6xXcMVhLmGB
         w2Aj+Xyw7ShMo8I2Km7SXwQpdilIP0WfPfYF65VUf4I2JJ4XJ3e9P6/TsVNcZr093rkt
         pSSnrUK4GWaEzqGbKcRFsHPJjSNPQLFBV7CLQ6ZChRG9hM1FO5kmXHfMipVaSPwo/Kh4
         0C8rHHYyHOa8lM9nU8UWMTB8p7zk7lXJ++blEwP5PDNCW7TsN3Iqh1qiO9hGDqZwbrmb
         Xe+WnBPWeIi6fSXjjPtlI5wgX4MFLbYuA0ljCZbX/GjR2wvYop87jOcb9O3FAnHVvmRf
         BfNw==
X-Forwarded-Encrypted: i=1; AJvYcCXulXkOJUEPKjtFADu3IlaHohIdkbAS4pnP6WEpCvPMTIkpMJIQe22tNpMZ+pgCruSC2fSD9jg0ULqk99k4@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGY+fXqQseMyYxQRASRdarF7VYQjPo/9NQByjpr24v3U1y7ga
	otrE+hEk6I+1FujfYtnJkyhfaSqei5aJiv1DrrkVNRil3JElfGoPkyskSxzVjN6/tSWnKW2ySZz
	W2+NS45gb5HaFbeGWEX+jKx0QL5082RxZygHTVSkdJ+LKOmZ8yhsRJB6YaZcNbCZBlrxM
X-Gm-Gg: ATEYQzzcSQXogxWroutmb075DIH5ctQvy7uqMNBMq6VTRfSui6hK2sYQzTV5ENdByV2
	8evQ41UqOFt/XOU60Yd3VhiOWuQcFS1zuE7NjE4pMf/zwet7t2PbL36d2RnViNAAvy+HbELFl4C
	OOcbuF5Qy+RbuS3LKoeeu1Wa4FANpciArZ/A8Q9+lKvR1IrodwhAFNS7fcM2vv1eekhL0K8Tfs1
	sjnrK1iNXGYFnda8jRuDnoCl4iPmLOBavOEIu3wPDM+sDGc+Er37tjjBIX3dooEyZrNq7h9s3I9
	yvlxcxFik9jVUyGlksbZ8jg8UZHDbVsIg08FZtkLEAQs3dteGdDA4NWoOLypo2peZmAYFYBAVt+
	LhIxhu1Tl9sZY91pcn1ER0I9hwK3M8B0C3/HCKheFpzuPu+PJrT44q/WCuOTWrZDKbawAHdCock
	QX+qI=
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1240590285a.7.1773655684322;
        Mon, 16 Mar 2026 03:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1240587685a.7.1773655683933;
        Mon, 16 Mar 2026 03:08:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97cb0d2df2sm49348266b.54.2026.03.16.03.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:08:03 -0700 (PDT)
Message-ID: <fe151ffe-aea2-429d-a725-4697381c4a93@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:08:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
 <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
 <uahvm7kvu2vi6o6mwznn5eqzqqscxmfetl4c3q3xa2eryg6ode@ltxfpjmqbrrt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uahvm7kvu2vi6o6mwznn5eqzqqscxmfetl4c3q3xa2eryg6ode@ltxfpjmqbrrt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ksPFk03athliMm0Fqjq_mR0DH6iMMNR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NyBTYWx0ZWRfX0l1wgrvSL8ea
 j2uZgm6Dt134hqjsBJ0Jie47Cbhf8mijYmAMZ31sEVvb6fWch2vdYr6ej6pEh5GiERYCJg5RzPj
 IaU/OhZ7ahosOIFyxEg2k7H9kZ2DK6obSHTLY8f7DVv1mQZ5O2B0KQzVdl0udaPJ1TXxSBKhzIL
 HgDRfH57Ci/26ZIomrV/iFgAqnwp7njKgkMUzvXZbjFr+ZBrLx5SFRubIw29n9z7i9yo2bDHhNB
 6twp9cZaBUhM+ZV66fPmKuYGRPSWm+5yowD4AwTZ2MCocr416RLl/27LP00tICtOtj1eAngrwCu
 8F9SQFMwinVhr0zHPHeUnKOkOxPICp+UV4z6Ov2tCniNXjQW2cPdJAFN91pa7CX4affZTNnm/Xq
 xx3AahiSDwLsIrL85f7avpJ0hoT5+pAVoHOVuCkfiy5qFZdRSEKB2tv5CrQXR16s27NATB+DVjH
 YGbXxJux72zgVxLhHBw==
X-Proofpoint-ORIG-GUID: ksPFk03athliMm0Fqjq_mR0DH6iMMNR4
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7d684 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Nnq6w86PQWoF-9HhF-wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D857297BE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 3:26 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 11:19:59AM +0100, Konrad Dybcio wrote:
>> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
>>> Use freshly defined helper instead of checking the UBWC version
>>> directly.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>> index ca59bcdde7b2..04efc29f38cd 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
>>>  	if (qcom_ubwc_macrotile_mode(data))
>>>  		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
>>>  
>>> -	if (data->ubwc_enc_version == UBWC_3_0)
>>> +	if (qcom_ubwc_enable_amsbc(data))
>>>  		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
>>
>> I know it's already there, but fwiw downstream doesn't seem to be
>> concerned with toggling AMSBC in MDSS (perhaps incorrectly?)
> 
> Downstream enables it only for the cases where encoder and decoder
> use exactly UBWC 3.0. This is not completely correct as the bit doesn't
> exist for MDSS 6.x+. For 5.x this is equivalent to the code from the
> patch: enable AMSBC if targeting UBWC >= 3.0 (because MDSS 5.x don't
> support UBWC 4.0 or higher).

Right, this seems to indeed be the case

While trying to confirm that, I noticed that some lower-end MDSS 5.x
chips (like Talos) report UBWC3 in the register, but the MDSS docs say
they're UBWC2 - any idea?

Konrad

