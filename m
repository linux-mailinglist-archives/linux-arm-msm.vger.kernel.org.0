Return-Path: <linux-arm-msm+bounces-105834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCPfMN1s+Wk98gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 06:06:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEBD4C64F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 06:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 962C43009396
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 04:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFED03AB274;
	Tue,  5 May 2026 04:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fb8xnIsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXGzKOHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876A202963
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777954005; cv=none; b=Kj6t5C3J4ANU7P4k2b891Rg88znHnuuQrrLz22rlQ0cBpZQUFOnMPzp2axKXTzD8lni8bzlh9gMwMhCZsdMGVD8rpmedA+g0zp01Gs/VQVz64cmviUOvXjW+HmGpdOaElbuD70NZOhrBP+fPtrkKF0Os59hSQQe4wbH66R9Q4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777954005; c=relaxed/simple;
	bh=F2upz59DyprDtwG6UHGYAXGVnfdJHegg8orGJRtcxYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hjm0Bguxv6W044Aqa31hQ9hW1kzm1vEsp4ryGJaBuhHQQzCGcAwl71Lp2t+3GDvjHTUHiG34nEpq2a2jJYz9p/OXRFBKndoRatnO9lKosQMsULqgDY4qnynou9m+eKvt51PoU0yLW0x5dWgRE4OGUMbt4SCh9laT3CLN0LJi8Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fb8xnIsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXGzKOHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644N1VWI1346410
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 04:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pZbHtSbvA1uDcyWdB+000WDtZcm6g9KXWfPaacKoe0=; b=Fb8xnIsqLu60Bpip
	zEGtH2p7Va8tSUKwiWZ84cmfvEHmIV2GU3n0dGUpjHvdp7Z4OhyNT5C1CL/99N6p
	mWIrX/QoXQ6u0tQ+4/8gSw1fxYy8xYTaFkDDhDP76aMSsdZiKkl5D5OHPhZ6DBl2
	ommfTN++g3GsFqiVQp4KItTXc2hTnrlguVbRw/vAZ4GHx8KD9J2re2Fe4ePN4RD5
	d4sXfC+ZN+MUkYzZQaUDSwc6E2k1+QWuztakCCbLhJmjWRIc0Ba1RLxtOhf9moBr
	Ot1RrJvhE+eb1Fxbm1ummTFZz4Nmr5aVkeDTfWE4j9xptNHeBHn+alk48w+Ybq/o
	3xWrUw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xa8cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 04:06:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2cc75e79b97so10252483eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 21:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777954003; x=1778558803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pZbHtSbvA1uDcyWdB+000WDtZcm6g9KXWfPaacKoe0=;
        b=hXGzKOHX15lWPWSEOkgvSWHaLpzkTsglqCUSP3bWiFY0GMKcGW3dOcCALa+qt218Yu
         yyiVILK/XgjkaLqQRceZsA8GRIyQtxhNS2lwcYWgLwTx767gBYheLwA9o3jSgNyhVV2m
         yFTVL6Q0bWx2T/q6tG2gGkmQ2/7cRT6aLFhQTgDREVnnS6X4WB8H/dryW5DP49Qgs/UZ
         BKO6AQJe9P/Vo9vBAWthyZ2Tv5YF0ibcLhhJdbipj2E4SrUPkrA3sFW2yuC5RBZ93z56
         el6vL7LPESrpsBjUIaovZEhVYFmZXee0UOQtwQzvLOcN+WSgBDfSwnI4RdAWOGuAg/KW
         kTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777954003; x=1778558803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pZbHtSbvA1uDcyWdB+000WDtZcm6g9KXWfPaacKoe0=;
        b=cmbJJ32wDQpWkVzaJGxMZxo4Z6i2HMo/aJABaLj6QPJTOeffzjhQuITz2GGtF+PQbf
         gh27pVZZ16WzmPyPWqCYo+9j95/OMPanWKOwZ0wFS37RAo8YktJcD0K34MGTgnNn2F8Q
         d6Khz6DxsP3DX2xqiHx15Q5eVKHbJ/AlorEVd8Y2kwg13WLEZe5cHzrDTnEoMQmPrh1v
         acVigcwSJeOl0bUn83Yh1vlf071ZxCBOx438rpXRycvb1EKjUkVBUNHhde1CYU8D8q/v
         PUmfo029clglQyGzEx7x3iqk4zxdr4i+hlClBbdv5rL/MyD9d5Pg1rylJPQIuLYTNlZ/
         Avrg==
X-Forwarded-Encrypted: i=1; AFNElJ+9lgOYJq++D+AIOpgL/nxV2g2ofGG7CuepgDZdYh97TVMAPSMNdgV6LlFwEFCqG19pTUW8gn1a02eZPVrg@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVwz3cRSYvjSfumH5slxgeDQZzUVJ0HTjUp25UvXihXxBDQ0j
	jptkka6Zb8LnTxCLvZ+OnwmhZyu7ibfWDNnJVF6FWVWzCqN14mp/KjcR5I0ZLjb2r+hIR3H59b7
	5P9yM7xLxQfftoSfRfD5E0bzPAG87iZrkXuNOb/gMR85GfyOG7L16iGjz0BflspzweWWG
X-Gm-Gg: AeBDietbJVoqVCrTK6jernKy90PUOCoMr1DTKRSFdZPr5BGPfmgac94//bjsu0dhxXT
	e46KXasi0SH9x3UgjeaZLMhw331NGuxUT4OpB1JcbsHn8H1GWbucBdJ/9bkNDwWV1/Rja10lDWg
	ek02TPcNCjADWXZRUTCMKuMyv4EzxvlzPRasMXdm6dFbTpF4wqL+7KwZK4Ckz4XwBtrLq2OCKse
	srFUcBijKcuvxeSLdYKuMQ6to1ltKrCJ1IutNCih4O+O3snO1rK2remGkS7jDQlWmtW19bD5nbG
	91vZdk8TFn50fKzPdfVmP4y2Za96qn1Ix43gXkUenTKF+hqbUbtv0sexqxKYgHD+q2DrzbirM/j
	2nUKyQ86wgrK8mzjvXnzKrGmTeWdWKGDsK2tgwqfkW3jXiJjnh+IjOKz9gF8y9N92icxQRnFulO
	8vIXYphjCSYKzL7fj9fHyDjyKg
X-Received: by 2002:a05:693c:25c4:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2efb9f808bcmr5821713eec.25.1777954002999;
        Mon, 04 May 2026 21:06:42 -0700 (PDT)
X-Received: by 2002:a05:693c:25c4:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2efb9f808bcmr5821705eec.25.1777954002507;
        Mon, 04 May 2026 21:06:42 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.243.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f28f7ba26dsm7520592eec.10.2026.05.04.21.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 21:06:42 -0700 (PDT)
Message-ID: <230aef5f-43da-4b7a-994c-7a63b631ae8e@oss.qualcomm.com>
Date: Tue, 5 May 2026 09:36:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
 <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f96cd3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=SdbDppvB4z130zS5fHlqzA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pkhheSlYpZ5lmKqxZU4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 4uzggBdXpzMhENHsWUDhjk8HbmyF41KV
X-Proofpoint-GUID: 4uzggBdXpzMhENHsWUDhjk8HbmyF41KV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAzNSBTYWx0ZWRfX0MNSteqpRN+W
 2Cp2dILaxoJgtnU2o31QgzT6OTBDpK7YNK6mBQY2BTIkQitzsaFnj9QEC0lmGroBl6IMc4xIa/M
 TA9mVDOocbN4rGL7IdajdLommwb3/ELxTuT3RdabdD5T7xYE52X6D30TMKRxLSoBDfwmF8niyjc
 dWjhoF6FOobRMneLJSxvEBRjSB0smD7IdE5nmqL0+oPbUVKnkCwdeY6Ec6ob7RX7bbp7kitzTVc
 ZlerDVfpI51sGY4jEbW7dmD6Lmh28lCoryw9v8SlvHgDyS4PZtXvFFDS9PjQ6ewjxGIa/fkliUt
 TFGmKoQLRntQHQuhn/4vdimDoZXWHG774bEHKLKgEQihsxF0DafH7HRnPdg9Wh2RhnQucd/ym6/
 +m7XlS5PjDdFGAbLeyJc0WWDF3JUh/rwc9oVCc0x1CKebBttpIh8GHgFFMLIiSPPZXg5G3W8nAh
 a/36griUIVm5Ik70pZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050035
X-Rspamd-Queue-Id: BFEBD4C64F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105834-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:58 AM, Dmitry Baryshkov wrote:
> On Mon, May 04, 2026 at 10:36:59PM +0530, Krishna Kurapati wrote:
>> Add init sequence and phy configuration for the Super Speed port
>> on Shikra SoC.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index c342479a3798..400dcebf8222 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>>   	}, {
>>   		.compatible = "qcom,sdm660-qmp-usb3-phy",
>>   		.data = &sdm660_usb3phy_cfg,
>> +	}, {
>> +		.compatible = "qcom,shikra-qmp-usb3-phy",
>> +		.data = &qcs615_usb3phy_cfg,
> 
> If we are reusing Talos configuration, should Talos also be used for the
> fallback compat instead of modifying the driver?
>

The clocks are different and hence I didn't use fallback.

Regards,
Krishna,

>>   	}, {
>>   		.compatible = "qcom,sm6115-qmp-usb3-phy",
>>   		.data = &qcm2290_usb3phy_cfg,
>> -- 
>> 2.34.1
>>
> 


