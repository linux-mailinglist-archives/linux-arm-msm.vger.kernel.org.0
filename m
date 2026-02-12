Return-Path: <linux-arm-msm+bounces-92703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOsjM5vYjWng7wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:41:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9159C12DE9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BABF130767C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1798535BDC2;
	Thu, 12 Feb 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIuORg1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amqJ4c8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51B35C180
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903673; cv=none; b=fQpnHquufdNQ/FHUml2ZnDwZI+uXxWDOcCKueq4awkJvLMIVxlK1VWJ02mRLERSTbrkSh+FobkuYdXKMg4AzOcEqeDqzDtVmrofcZGNnu+TOpSVSpthyNIWG0tfq1G4WqRcMGAnT6yxDDQaOhw2VWcnDc3SQma91EstERcTOprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903673; c=relaxed/simple;
	bh=nAcWn1YhQ3PHXqMYJwlRwitF9aeMboZWC1V3ud+4mtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvpAWaNZut2TDXQ27sYE0XQHAl+BUvdXJtD4to30vOIT3OEDnpbowbDRiO5YShnmNY3gMc+a2EnX9biKW6aYxUIpTEQ/ZDIyFlrfBUfRy9jNI+5sQYRBZu41qpehJl8lPxrlNoF7TKy9Xtmgj+tIPjnhdDMUAZ3sGqMq7A+BHZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIuORg1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amqJ4c8j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRhU61580831
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCRCDzmfXns7/oXNTWW53o+t1npEgX31smcF3lGgN8E=; b=pIuORg1ipOMazCjN
	Nj9FuVe3Babh7ivPL0Qf0n585mBcBTzm7Kkc4Vx8tdFzLI9QdBMZQT2QOQzdITF9
	7nHvnHnIGZuzaCeQzs3UjQBOkoS3kZ6rB4FajSK8uuYpuGiW+HvlLTqKLEejaf/6
	jMGwIJE5i+dsSol1WjUvUzgBsDcMWe/wuPsHLTilomRpfGSGJ33kyI5DVCl96J2o
	rgA6dm8KI0HADyl8TpWiy69rB8US7D3OIjq5zAB7oFGG0QOXZPWRT41k1Hffr7NR
	9qTtomsRNx8x7fFbS802wtAs1KQ66gVoYEuGMfvNNJ0w4dwv3Ia3x0PLM6T51wLl
	C9wTQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9bu4q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:41:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso17929785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 05:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770903668; x=1771508468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCRCDzmfXns7/oXNTWW53o+t1npEgX31smcF3lGgN8E=;
        b=amqJ4c8j+D6bEC9yiB5i0Uq4wiC/gONN+Sod5JuTL4DDeiHcZ6wvP5Go18rFR6lCkF
         0LcXZA9b7mEIi0sNh+5W4SZNPg5oHdTqDTTvpqkaQD+jVRysYFFoWL44kngRPVo4JR95
         68S0tMhGy4qQCgctBRf4/VKMSS2NXj+Zi3lioWRASRnbdbKS+f8EStsx95pQsNEmZF/H
         NUA1ZIHyPKPB8geS6vMWXffUlCSGDQCag4eEhMUo1PSNIE7qTMBp1MxlvE0kIu26HfOM
         E8tx2Be97w/VsERkgHxAqOKpWXmUlyTL1rmhrt/eSMCGY46E3rNHsMin0HrsYR/rMQF5
         M7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770903668; x=1771508468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCRCDzmfXns7/oXNTWW53o+t1npEgX31smcF3lGgN8E=;
        b=V1mqiuNdZEe2J4PFFIFJIuFg6/Y5yEE5olr8mNWm/vQREH/GfEw4XJBfLfvGnUHSjF
         7Sh+T829eHoUeHtDOfCM6uBcE+6Cwo7qwoZv0lDXChYal7p1BbcYx+AgnZWdtDmXMgKx
         e+PbxGyTMoUvz6zFvVCgqhKcQaP3qvXsgvTQ3hWYoDTBo9yeRqmFu+t18tSjjzvao5AF
         9qno9TX5sG6Jgh6PxYa3T4XEe3JupPxf8sNHsGEw/3J85JneAJ6d/tWQ3CdpjG3cAVC1
         HMONpP7U/CUFXhLvcpT7HV/TRyaKs1kGztNyPxf6SkzpCnB3VBPfdboyO0msYNYwW+J8
         fQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0bh8uAxt0B6ks3FwMRzrXc1RwIOsGsw1+c8U7TCP46lfhEEKFlUlLxDtOT2UX0gZXuU4vcDArYmc8bAso@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKYS5TMUPtsDcOjlr2O0HwvXoieO7bsc1jT3Ccf13+xNRCavs
	/7M4U/2z56Tnd2T7YdYWhB49w+6zLm5asQj86ga+LlCB9pjmqUASMHxLlKKAUp6r0BNmuaFzq/q
	YIe4+QHM9hBvUMKTDC7bD3j94P5nHIQGQEaz0UMYqp5H1ujlV/HOOYxzZdvwYThv8Xzt1
X-Gm-Gg: AZuq6aLfG8bVK++RSjAilvbsvQ/byL6EEWWD/qnWzXWQkKPNrfynGi2vaE68ZxfxnsN
	5sTuYzwdEPUyv4+o2a86YnWafunIFG4Pl7J0eC1Lk/B/KupPyZDA6mPN068zmW2me7S4xWYqM9H
	3zyyDlktA6OC2+hGBviHp5ngSbj0s3oWJOaJkCtiBMbeWMSQEx38WDWrISBLkCqgQY6z3aJKfK9
	qgbqLEv61FuF732BYA1CWnID2LIZgbq3YJ+tFbqL4hpSm9Jp2uCcpXrQMwHnrLY3bjwyfiyR5JY
	ACyk6XGKEEc0kIZYfqGN20GJC65mLB1H9KyMQn1uxM2Rbxcphmz1fLQCkCxuHH/7VUX3M/hL+zl
	SOYl58qpxw7YEoPfNkjKhXNZIcX2yb6XYA+6HIuPsCUsQ3lRsEbU3dOqtk/fn0Da1DGDgRjEStf
	LwZJ0=
X-Received: by 2002:a05:620a:4407:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb3311bb60mr255614385a.6.1770903668188;
        Thu, 12 Feb 2026 05:41:08 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cb3311bb60mr255611385a.6.1770903667788;
        Thu, 12 Feb 2026 05:41:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f9bd846c0sm36946766b.3.2026.02.12.05.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 05:41:07 -0800 (PST)
Message-ID: <0dffe84a-d41b-42f0-80ac-fbb8e81970da@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 14:41:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add
 Focaltech FT3518 touchscreen
To: yedaya.ka@gmail.com,
        =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260208-touchscreen-patches-v5-1-5821dff9c9a2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260208-touchscreen-patches-v5-1-5821dff9c9a2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698dd874 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Uyhorv2uAAAA:20 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=SvwoN8VrOMzw8yseGhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: mv4ZXaHUKX5jcdmUC3ChyMc02xY8lc3q
X-Proofpoint-ORIG-GUID: mv4ZXaHUKX5jcdmUC3ChyMc02xY8lc3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwMyBTYWx0ZWRfX/RCYl2Yc0N9d
 0mxvo/lpE7Ie3BvPm+ARUqlgMxIZQPAZS75x6FsmnobMz/0qdGCUN98fBJ1r310OA9pfeiMrjHt
 TwrMpHbvL6JZskkSml2BRzd/cWXwRuMujXCXV5MEM8gqkw2M5Aizg81EVxZdEOFBYo4KhFaHeS7
 M3wkHAAh7BuVW/wd05AiFByEsaQxq9y6DfIqgudq0Makn2ObNLBPW87H+fp2ClPa7WrbfwmmMkf
 tn9lC6a+IPetW2ke6QVe79ncUWS/SR5ZcPO5r9vXY/DI+PrQrZ9ALRl7FpA5aldrl7cuhGdGCZd
 EWV1Oleb8RaB9H91DmkhUd9t1AfvM5MNmv3W9kgxhsrX6TmJ0+qcnGvNyrIlm+Vr24ly6sxtGCg
 e8QtfhwLqqsAdX1J/J4qIPhMblftuD71NxInceguObLKjAJpyvgmppEyMFPfFwEZAKsQRY1PHZa
 DkinHxbDepb1K+RWQjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92703-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,protonmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9159C12DE9A
X-Rspamd-Action: no action

On 2/8/26 10:24 PM, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> Add device tree node for the Focaltech FT3518 touchscreen on
> Xiaomi Mi A3 (laurel-sprout).
> 
> Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.
> 
> Downstream references:
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/trinket-pinctrl.dtsi
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/laurel_sprout-qrd.dtsi
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

