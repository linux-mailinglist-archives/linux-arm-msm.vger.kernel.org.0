Return-Path: <linux-arm-msm+bounces-97684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGNlGYgMtWkzvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 08:21:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E728BEBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 08:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B7B73012A97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 07:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BA31DA62E;
	Sat, 14 Mar 2026 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjQdafnH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JC+C+w3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842D25477E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773472896; cv=none; b=YAgIEh98OqwC6iqjVJ+RHX5wDC3VAFu3iA7gnyo6Sga58JH47BH9h/tfzUMypbymKfDukatyieSq+0jMDZVjinKtkJFq2qQLDqgPePKus8VZVUOw5miOd0yRHi+rlZJScqyEjFffx33clca5bmKZ22FlrQuicc7bzktz0KhQsUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773472896; c=relaxed/simple;
	bh=n3gQPsBYj95+UFJRlTWdyN6szSVhNHeFCq3ECtPYD44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hw9qlULQlDIwfTB8k0BoHJbHD4WymuDLWGYx+OIlWf2s/FwbCbXyEvEFebAo8gwXhdenuHGOck+E0wYfvR630QL4h8Y98VN1kDW8jsf9t3/1jwxj4MqYHsqPjn4VLkYKPYwu8erwlDfN1+1v7fLlJKtyxlzS9UGQmY/Dm9ArGHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjQdafnH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC+C+w3I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5QepZ3729122
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 07:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=; b=pjQdafnHGkZ+aKVc
	NdCKU6UoGRmo30NPqRauAzKQypsIDLgBGDrHWssiH8b1R80YvABqEinbEMBBWawZ
	jgAgkvb08v1XTTFuxikbLKktTL4frjF9Oi1T8J6VMi45tWN1Qlwv/4ZMLhhnI4sW
	hiUm5XfFAFqcnQX644xm8YJUkEZlGHsTL1EnhCdv/VJcpzhMJBHwXELJaGFXRgmS
	NM1X/wRj7GV35pfkp7Z7h6Zm0UxN9pJIzWil79wK9sPh+2XUM3JqG1/bf5Q0bcmP
	Bpn70+1aSiCG2JlNTR2u44goUcEBhsqvekqI2iwkW8bB9BGACdBvZLSkPvPVDzB9
	99DW8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc0apm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 07:21:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aecd4f7c37so16774405ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773472894; x=1774077694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=JC+C+w3Il99qRcwWLupaiwONE7dmAOroQAqCmZyCAsBDpn6Og8nAkf0quVvqSim6g0
         GPkVkZAcXbDnM5hInNz1p4dw+ddKXTmc6lKZm8rruGyx1EJDH19Ferne4FCZHcqhJ7xR
         SzHCozyZ0WQBdXgcOud+jOY6LIgSASHQlZonWc5OIGlhdTn6LDrvqbe9scFIBVJYcH5/
         Es2Yu2/RHnmLpvtC1Ys5V2Jqs0RPG+o9yYdypEybyqUT4STMdvm7O/I43CvsCEW+KvWT
         tj6WMkoLo//Ved3sKE/xUecDR7sShDUz7xNRq+KIwdtMnK4yAiHewSsNfK1pPTwGo2Wx
         G4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773472894; x=1774077694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=oXF7RiSMmquNzE+TCzX850mvbSnRTfxRVV7dpmZptWNZ1/nKUc0B6FoJB4fjwpHhcJ
         RQNq8LpVsv1W2Y/XfIsNm2rCaFX698qbvFXevCdvgLj002H0gmQcyySj95E7ls56vH58
         qhfJiPhCiw+euTts4EIqG4uk6m7cNHDQXgBnAVwQh6amJuTjctQJNpx80KK7Bc7uHLrY
         F2N0XVgq4rBSclt+dDogpvhVyrz9gqVDnVvvI3L89oe+jsM1AeedfeIMnwKx91RaZGlW
         4i3lg8b6g0XUL1fZoHvos2CKeM2piqlMzpkX02Zf2sEDErQZgfVmWuhX1rTLaSCL1Z6n
         I1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYPtHRRFGcq4JZ5ArZyBXybbjZ2HYlMgLdN59nLEHXwFTYK5dwBgt32nsShLgXKJzIrieYtM+Yj2/N9pOG@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiNDfKReh7aBbyNIlARL9K3a05gbaU0/J8GUifphtDD8mUpwq
	Fmm1L6hiKjAT9zw0j/ahY48DvCE7zg5fxKlUuEJXk9KefOsxat6qsB0pIr6o3cjvQgj/0HZMYup
	yfWMi+2TQ/UCQoTvU0ryZSeNp3OT74l3GGtstq3sTmD76XXpoFYYj4e3Q2AVDKOihPeq+
X-Gm-Gg: ATEYQzza/qi8umlwqswEUL+xc6JgzCFGBQaDYb5VFjyki1VTrvSFBJi/VgO29Z1N0m7
	NRLjtMXatraqB5nJwLtEhOljGE8Os8W1EfeuqQWN54ApSMMruhVGtYGRewQOiKSjxb9zLqmLcGS
	ZYsENvhrxrWvWcYnol8LtbQHLvDWJGhd7jCVE7/BCOz33mVPsh61Bg0CJCsQsHdZAThNF5hPOcU
	4+UNKYNmuapusUzCjuasz2BCFZxr3iRL6HTNQsy2TQyxBccUj9uiSvbaVksel5l2K0NjmG9pdaT
	kYFAN8ZXFQbjJPDelgXTC43DGi8lEzIYG6SgZgVlJEfWgyu8IY3iQOd7gy2ZQdFt9j3LBWH/XcM
	EjmR968bh/xMT4+lw6bXguo8CfuMUtetx/Zqp3gAg6vb4syq1QoqHSo/TC1v2BKOoEW8jhpoUN7
	V2p3mNv6xomA==
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57767855ad.29.1773472894141;
        Sat, 14 Mar 2026 00:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57767635ad.29.1773472893643;
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm41005825ad.84.2026.03.14.00.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Message-ID: <7b40df1f-1c53-47e9-99bb-13d6d030eeaf@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 15:21:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
 <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b50c7e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CqDDh8lFt03Jwv5G6gcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MOz5NF5tQ_bIKXfIGsJTYKbcgw9twSRY
X-Proofpoint-ORIG-GUID: MOz5NF5tQ_bIKXfIGsJTYKbcgw9twSRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA1NSBTYWx0ZWRfX8KxIBq7PezvU
 LlEnzcbAAg2ji+dXZxocqnLuCE9mUh1fSK8sktxrKppQ+1vIOYRqtaPPFNKCUeztHvoKCyKn8+Q
 fN57CR6qqbsgcYPTOCoX8Y3JWGmgYH3Wyh23FazFrw54+X1ZKeXOuSVhtNxYcPlMtMaCbsLsczh
 gQ5gnhrjL5h2M9jJioxWXk4hjoBHfXBdI/3lnnPmyqaNMp3aVvhOea+wrfnYDZKZSsnbtFoiHew
 oeDVwFY8kdNiPS0ewK5XDDkUDEUsgqc9R7TY4x7vijy5h71E3yrAyFBpgkbyi+njK+vdiDHqctY
 j1gP1TIuCLq0/jatbwIw1e1JJOp+brfAXVqizMXOXyfLmQ8xZum7dlGuxiVTKzfU9J0iaXbHjQ2
 STb2matOg1CroMNTOEGFkF8+cNAHiqyg8oLaDtMgKG0pa3IYUbgM0seSB9SWxVIxezbdM/UtE7J
 c3tKm0FimHXPOQms8PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97684-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 639E728BEBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bart,

On 3/14/2026 6:09 AM, Bart Van Assche wrote:
> On 3/8/26 8:13 AM, Can Guo wrote:
>> +static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                     const struct ufs_pa_layer_attr *dev_max_params,
>> +                     struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufshcd_init_host_params(&host_params);
>> +
>> +    /* This driver only support symmetric gear setting e.g. 
>> hs_tx_gear == hs_rx_gear */
>> +    host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
>> +    host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
>> +
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        pr_err("%s: failed to determine capabilities\n", __func__);
>> +
>> +    return ret;
>> +}
>
> The dev_req_params test is not necessary since the UFS core never 
> passes a NULL pointer as third argument, isn't it? I propose to remove 
> the
> dev_req_params test.
I considered the same when I made the change but I didn't do so because 
I wanted to keep
the original codes as same as possible in vendor specific implementations...

I will remove the check in next version and see if their maintainers are 
OK with that or not.
>
>> +static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufs_hisi_set_dev_cap(&host_params);
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Same comment here - please remove the dev_req_params test.
Will do.
>
>> +static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>>   {
>>       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>       struct ufs_host_params *host_params = &host->host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Also here, please remove the dev_req_params test.
Sure.
>
> Additionally, I see that identical "if (ret) dev_err(...)" code occurs
> in the three callbacks shown above. Shouldn't that code be moved into
> the only caller of these functions in the UFS core?
Point taken.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.


