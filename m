Return-Path: <linux-arm-msm+bounces-116073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H9oyCleLRmoLYQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 18:01:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D56946F9D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 18:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mw2aa2ms;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aanIRs7R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116073-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116073-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C38C307E12B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 15:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0202533DEE6;
	Thu,  2 Jul 2026 15:54:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F8310784
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 15:54:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007654; cv=none; b=Fm6RVwARMVv7FI+JzgSLRKCbQE3eCW3jBZJsG52w/pvVrrC6pos+UXoduCYylpQZ1Z9cmw98SQknhBiQky6UCmUpcmcsXf4TRomWDjYX/KP1rzR6fEaxFWGegAT2KHH5iDq5pMp9zGDbGwc6xRTUtueIFob3GrwX0um67oKHQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007654; c=relaxed/simple;
	bh=PGzJjQyVASOY296cJVlGrJNRwLME7uZqzZPl1eLmGjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNSaySHI59I98uDfFy6uThjvAdcnNJta3I9cOIz7nPWI0sEB0DjJ7EEAZQ7gV26K87n5hl8sGC3JiL0LqjdI2vd00yPvT/pCGMImsXB63E5fUdY2LVGt1zp1jd8c8Jth2Kdc1wb1sLtM+9XelQ66PMIjK1UivHBBpsIrO4YjHKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mw2aa2ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aanIRs7R; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3PTd559970
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 15:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6x2cFE6unxjGxiwK8PfHeJpInWtKm5Zn24hzqi4dKk=; b=Mw2aa2msrY9PB3KR
	N9wAOvyqGE2xQzgyGNTRTOIlKOROsnyWxpvFQRyHqaqGVNuyaXUKHpTjvdYQogmp
	W+r1/ToinuV19jDmUkhCNgmbGjVtETUE88WGw4p52krmO49VOnYsLvI61+7KTW3o
	Bx2eVzDNJv2Lkf+EZ9V+kl9t7Nbm15qEXYnUY1CoUcbw2nuG2iqhN/iYbiiRDGTa
	ALCUU2VGmeh4oKr00BzgET9IG4vefrwC6WMbZYRKaRoImtPwX/8OnZoA/T0iRfG+
	B3ZbuduyEudcSVCjbvTjoNa9LH+d6AevQuoD7IGsX2RGPCVkYD4AB2am/FvWMeXt
	6S2OOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n941mhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 15:54:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0d4fb061so32367125ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783007652; x=1783612452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q6x2cFE6unxjGxiwK8PfHeJpInWtKm5Zn24hzqi4dKk=;
        b=aanIRs7RiJzNZXffBTGjD8S07JPYB7dra+nU8soqI2izEAoo98sUpanv+ZLTPSkKIg
         Wxaf1Py8cHbDm6obsjO0MZDm1ZY/24SNmqjc3Vh8nQAl8Hjs6lB4KEilIdHoTIYDSeXX
         fe0iW00EFZm3Zk27EvJvfNJ2lcCzJ7IIBIDK1wNyDvaZlexVIvOlF224dIPl5za23Wyg
         FXwMnMTfrZb3+f0o/p1hBs524DYtk3PX2w86FEVZweZY2GuNDum19WxDKYpq4Ahp2pS0
         owdoPXsTadhejADvzFbnLW/ChP4uR/IOUYlT6jblwpb3dP4SfLufNlJYyQSYwCfXC5TN
         TpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783007652; x=1783612452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6x2cFE6unxjGxiwK8PfHeJpInWtKm5Zn24hzqi4dKk=;
        b=LKtmQ0GUw8ybFPWm8ZAtNCqPyoVFi6H40eG/e5CT+WcEwB7aMXUMPQMdnCMoX8Paws
         VNTCuFptbexQ9izskz4R1gAoi6UA6llLeYcCT6FNr1ZxxxZEcP95P086cTpZU0Ol8/SU
         LsbnKCV9SD+sqftgNE9v7vqiadq6dJe1b84EAG7Xr3e/kABQQk8FBNbKsMjLhIsrLlvo
         Be0R1ejv80rIAs9MT3HkgrYWi9dCAdd8EvpY/3uMNLemotgAQVMPEe7k3UxsYDsrYSJ0
         Vr9ZpJcO6ZGl8yBZowzeelSQBK3t2uztqyPEoT8rfk7htQJEsFglPig/NE6n5mjqSscc
         qNEg==
X-Forwarded-Encrypted: i=1; AHgh+RrWhHku6jB8SesQTrntitcsnjdRtK42vXqoVMLZsNND2Kcs0WLX4vyyGo/6uIAO8TiYgHAiTqK9ZfJ5PEPQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDdnVhmQ4VmlEyeWslwC6mT86qanX6EDy4Nnn28VEXiIWw9Zs
	o+p/MVXCTxg799W5oMGM5rL4MT3ToTKoxzTRL/uN+1wOPjJm3A62U8O/02ch4AyC9n1CAEToMVE
	kc0FYRan6/5gWccB73Ymrcj7alfE0WD6fk6h4Wfc8dKDp1Kucajakay9vrW03vq3McN76
X-Gm-Gg: AfdE7clhAndo5/LrfMptKsfgorWp9oBs5fePSfo3tFoyHUSyeUnrxvvKHeRBjoD7OQh
	3k4u2B4b5QARIdDGy6QS0iy15EeIQoHjiTaWAoZyMgkkd1l25uOIfASKan4vkD4hrNVPymYhqgA
	2YEffvJwvkFEYXT32RlLeuygi+JDlUaj8e3v4hqxWbPsGKBkaaXKw8xoY0S82Zccswir2lt8/vd
	+8zvZ639vXA/ad9AcJGs0reWUaHkDLXYph0mt2jvsogqTTT3JIthLiUWZW7ggoiAWxemWA8H8ed
	Oafa/td2xCZaiAByFH1AE3iHlgd8qTiQOANmQo2XtppWHBJp4OQmmqBZlzoAe1XfVU0Le/76ki/
	0X1EQampgLAsfusWPv07DRF2ovIRbRLISe/2+mA0Xcn+5FL+V8JosBtJe58YDx2md5wwiEknnx+
	v1kA==
X-Received: by 2002:a17:902:eccc:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca7e756e2dmr67124845ad.28.1783007652392;
        Thu, 02 Jul 2026 08:54:12 -0700 (PDT)
X-Received: by 2002:a17:902:eccc:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca7e756e2dmr67124515ad.28.1783007651867;
        Thu, 02 Jul 2026 08:54:11 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.240.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9fee7csm15691255ad.69.2026.07.02.08.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 08:54:11 -0700 (PDT)
Message-ID: <b4527f73-1884-4a85-bf65-288309d040e6@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 21:24:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] phy: qcom-qusb2: Add support for Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
 <ym4zec5vw2mudnvhw36w6vkuqupbl6up4dqmhk2sqeabphotsf@sudiy6poyjyx>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <ym4zec5vw2mudnvhw36w6vkuqupbl6up4dqmhk2sqeabphotsf@sudiy6poyjyx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE2NyBTYWx0ZWRfX0mPYyXWWCH/Z
 SElSTjJKy74AQIWXS0WE50USVgXQw89EFeb8+RgY2z/su5HnTuoxbq1AlPnh+BpQE34m3K+ahzY
 t2OlJwrK2xVY9XyFTR4WjMtnZAZXgS7tXUDMaCGxxcazRbUpOCWeJ5i2LE/MQXi4/3rTfcBhHxo
 L/GhB40P0lOeZGe/2D1EIeZZ+OQzKsybIpHwrKi3/ypuYc507dsHeSuCioaarnC0o40iC6UfeXl
 7noJL8SLvxhcbBOR/v1jPdvTMwrEQAVAOW7cxdUeGh6C1vySvPUp/Jp7D+VhHJixuTH2RASNTeE
 0SLnZZ9mYiBN7Jr9ETiiRu/14yXO4CvJzgSqKJhIu58fd86TB5VSlxHKVexwS75Wj4WnXRN0IrB
 mtUs1RXno0mQZme/MxwZwaB2BQEeNiqaahc3FRY7WClh0p4K9U7XqyX7eUi+ypjXSlzek7TBLJc
 wACnfjm808Y6SJV9wog==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4689a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=WwE2FERyN8QvVYJ+zedRYQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FLyz3zfJLnz1irVRmH8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ukKFsbn0an5rCpzMzhu-SIap-J-mCa84
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE2NyBTYWx0ZWRfXzno3EOlTn3fp
 vN8tWKx/CoZBH5/WB6cvFLH5PRqR0hsPnLwa/MbAHbMm7CIqCqXCS/jbQ8Aco9gQa2S/pFV9fim
 Wk/Rm0r351Nd+5LmH4U/CMlnRQa40yE=
X-Proofpoint-GUID: ukKFsbn0an5rCpzMzhu-SIap-J-mCa84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116073-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D56946F9D6A



On 7/2/2026 7:18 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 01, 2026 at 10:20:50PM +0530, Krishna Kurapati wrote:
>> Add init sequence and phy configuration for Shikra.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index eb93015be841..ab7437e7b751 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
>>   	.autoresume_en	 = BIT(3),
>>   };
>>   
>> +static const struct qusb2_phy_cfg shikra_phy_cfg = {
>> +	.tbl            = qcs615_init_tbl,
>> +	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
>> +	.regs           = ipq6018_regs_layout,
> 
> msm8996_regs_layout (otherwise you are programming the wrong register).
> 

ACK. Will send v5 on top of your upcoming v2.

Regards,
Krishna,

>> +
>> +	.has_pll_test	= true,
>> +	.se_clk_scheme_default = true,
>> +	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
>> +	.mask_core_ready = PLL_LOCKED,
>> +	.autoresume_en   = BIT(3),
>> +	.update_tune1_with_efuse = false,
>> +};
>> +
>>   static const struct qusb2_phy_cfg sm6115_phy_cfg = {
>>   	.tbl		= sm6115_init_tbl,
>>   	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
>> @@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>>   	}, {
>>   		.compatible	= "qcom,sdm660-qusb2-phy",
>>   		.data		= &sdm660_phy_cfg,
>> +	}, {
>> +		.compatible	= "qcom,shikra-qusb2-phy",
>> +		.data		= &shikra_phy_cfg,
>>   	}, {
>>   		.compatible	= "qcom,sm4250-qusb2-phy",
>>   		.data		= &sm6115_phy_cfg,
>> -- 
>> 2.34.1
>>
> 


