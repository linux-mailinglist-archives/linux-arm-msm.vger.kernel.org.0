Return-Path: <linux-arm-msm+bounces-113630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ftcHseWMmoR2gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:44:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C5699D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:44:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pda9F3sM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eQV70e97;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DC793007ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC673F1AD7;
	Wed, 17 Jun 2026 12:44:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1693ED126
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:44:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700288; cv=none; b=st25W7qv3HlLUeb8fnAv7r/y3yPFdAf5upzEFDg8VM7W4t3SwB0hWDmlZKLAdQ5Y3wjgjTPYVKCVey+eGQqX6mjZ+jWlFiB0eZ/KynYRQ7Xbs7A8EzN/wR0uEUmVyGOz9TcdGhZ1+ETEmli4/EBQ8Jc+e0QfpsUFzEQCqZ6JgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700288; c=relaxed/simple;
	bh=eJstloW2uNSbMNmuAJEHSeOYil5g4xbqtYbzXqxNAdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9l+81opldGjrMthkQUUVamZVJ7itENOIhEVpgF2lFIUDITDiNWgW4q2w/Jd7+/EoWPVKPT+tQQDHZeQFPIykIznaB1E5l83GAhSweAZzzfrTRiWN9DRaOzLC6Qkgc1BQ5Za4HdmovxQ21Wm2N57wRBFSBwb2qg0epSkTUcozG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pda9F3sM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQV70e97; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UOlI1703203
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RN/3eykQCaBeCitaPquH73O6bIsCGSHsqz7b2YuNQQ=; b=Pda9F3sMejzdRzpl
	XCMvPd8ujmf3RtL1Re6GmKiM16UwX/NWIbv4XaptsKdI2aIcHFJGZ1n6AYWEy6wS
	hoUJBmOmKD6B4OaGzwj2hgbwbdR4oYXfUepMOw928JbTpHdyvnx0WDIGyWzk9zWK
	RJsl9IWQ8RcuG9/MqTIjYIznnL0ipnTxRf9rOpwugCGpjJI81cnbUbbnD6qp1za6
	zgYw5SNVu4rKWboTKd67BOZpIGwKDqPGG1+8KchOTWwOt+/a2JWG4CwpqBUvYJc8
	R54N5B9DvDS0WuRUII1VhEKGb6cBbVGE83lOmgqBSACTQKhTAICWGL/C3Pj5czRE
	Wf2Zsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet32av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:44:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a547f4b3so71416585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781700286; x=1782305086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RN/3eykQCaBeCitaPquH73O6bIsCGSHsqz7b2YuNQQ=;
        b=eQV70e97/EE9KoLEWf9ctgUXTY6URiihgf5zepb4dCAIfuACxI+xDR8QBMls52arCF
         q5VCvSb2b7nZ8xDHcVoczsmKwOy0H2LD43zf0q760Zu9dU7To2kjfABAg80pP7r7WFki
         zik5LX+V06/Amcvwqu2rlO0aSDPdITvvO/bFdL+bwKdYbsriaBd6Szs3+/qz/nedsb4D
         3gk8rL/Pgbs1GZJ2MQRQAUjqbuzZYvLItRVwqGoqV+0g57Ua3DfQMIZBwPA4J0ByR7A2
         v7aV+Wp5LjSlKdNtI0yhp2zFZIxbtfce0FwbTHCC3g/5g8r62t/oiwlMlWi65+iMzVG+
         ED5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700286; x=1782305086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RN/3eykQCaBeCitaPquH73O6bIsCGSHsqz7b2YuNQQ=;
        b=p/v2V7sz9hde84WgZlwoNw+UZnR4I04nmyPePWnEqkWuGNNDCEtgXNXjeEZ/S5l8M9
         ZqtY0P5DvTkB3KYALQlTjsK2AkgtyelAV4fg/DB5hbxBdJxKC/R3lBuU5i9B5GQmjyPt
         /dt1oNI7Q65S7/dTla9Ak8NiHXN0b8OqB0m75CTQAwmmzGWKH5nPZcLVG7xvgJLqYe1F
         qzDfcm55k0yQZvzJjTUk4lkSPuM9f8yJXrdGT+CQq4JY29luINxwR+hmg9OihePYAUhR
         fHmlcrJLEF+0BoO7t1kE+0jUQtmbSuMGTRWRXbrD13XCk9x2tQ2IXyiAGdPClzbL0Cbp
         xajg==
X-Forwarded-Encrypted: i=1; AFNElJ8KIbYsZ1xqaLJWP8hnYHDH/OFOXkhwH48kfynjMHdxLcGxVAeUhMQotnMy7S1LyCFX5X2wIzrkCShHgE+k@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLaZSAeCMi3hQ0MFya0foTMsaYQtPRP7cWGeAnjb5+zqIIyUU
	gqCE7C34Nw36/socB7zckrz//if9fptKwqlkZILxWSW71k9wpj7YMC2H43ueoOMNTdSIgHdBHUC
	apkFFKOV9R2YaWCGp9ejdq/G9ebtp8+chLqGrJwXZx600utd2e97bRejtnOsjNxO/0oxP
X-Gm-Gg: Acq92OHSurawxntEaIXn8js7yGFJ1PZtCUi1NAhs5vV1b+N7MM9qHcpynM2msTjZIi0
	ITERkgB3l4IxT0vP7udNp360CYL7Mxqot0tmJV8CMYVm63iFycHaiPlU3FwVTuTfflBedEiGPnB
	76fvoCd/B1YJUFkNyZ1b3oifotIT8wFjtDEi61Zc7u2Lu1Barrb9GPfE8HxUfeMvjOhqnX9MSRf
	CXeE7oVUEhguJ4d9EChBqjpOsJOugcvt9wzL6xqsYx8r2/hA1uXZpTP5+DJPfq0rq9jXhHQVS1/
	mHwiZxflp75IED5RaGJoeJLH17deClvoYQKEj5Fi8sGRWbinWsgfx+MqTVnpiOP469rAULmd1lx
	bahq4LWigSqmtrqge0FfZfRG35fv3B4+8sqQ=
X-Received: by 2002:a05:620a:2908:b0:915:8197:4490 with SMTP id af79cd13be357-91d8cfae231mr374726785a.4.1781700285903;
        Wed, 17 Jun 2026 05:44:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:915:8197:4490 with SMTP id af79cd13be357-91d8cfae231mr374723285a.4.1781700285342;
        Wed, 17 Jun 2026 05:44:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm14224681fa.32.2026.06.17.05.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:44:44 -0700 (PDT)
Message-ID: <bf9a7031-c6d7-4897-9ba8-988b92f55dd8@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:44:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QY-llLaybkCFmTLB4jRIF0wG_9VGgzP_
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a3296be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=o19EmiD99IrPSnOigvUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QY-llLaybkCFmTLB4jRIF0wG_9VGgzP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX4X5DGqubi87D
 IKQ4+0ChC8s6K2j7qHOHm4QqI16tpwPV3mSlbemk9+Swh5LitJ7qldC55nmt3+CXQ2IFE731bcw
 HnNTja6DXyjizlPvbGdi1mBuagXIqFY4pjHgF4QHTdtN+YCDkmbujHOu9GMhrJkp38oY/ngRNv/
 04mawu1W6iCMutKhX4+soNdP01K5hp1uxRnGffEXeyixNt6jrzhQi/WROJQzbOIaD259jVai0I7
 Ljgi0Mlt1bM8DndejjeTtcCihjZEZ6W/JSsmDUzAGbiIOM7bNZKdlWmm1WgP3igmF3NmTBIcdAn
 DVWfrbskKaY7YlfZcYRt0xIlBvQrP9VmYyPkB33i/MDO8Vt2oeOzb/AoHCGekU04vn5z4j7lcMH
 k6Fsv8KbwWWwrPeolS7Fjdls02z1V/p11u/eHAzjYT++0NqSqNF9KNkjvbYB6OR9Yl6wlg5Qkol
 4pSdMGvFMhvaUHNjw1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX2WQj/X56t4/R
 4QWqcyto8LqtT7uTE2V5bXLvQQq/Faka6NFyCodOhmwfguBl6CnyjTF1W83KvzULddbRvwYkyv4
 vfD7LGyTRLQe8FfG73jtAlS5yTdtRAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113630-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kamal.wadhwa@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 715C5699D4B

On 5/18/26 1:49 PM, Kamal Wadhwa wrote:
> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>>>>>> --
>>>>>>>
>>>>>>> commit 457abf6e7ac410430c866842e08e602ec3daaa51
>>>>>>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>>>>>
>>>>>>> arm64: dts: qcom: Add Shikra CQM SoM platform
>>>>>>>
>>>>>>> Add device tree include for the CQM variant of the Shikra System-on-Module.
>>>>>>> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
>>>>>>> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000000..401e71720519d
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>>>>> [ ... ]
>>>>>>>> +&rpm_requests {
>>>>>>>> +	regulators {
>>>>>>>> +		compatible = "qcom,rpm-pm2250-regulators";
>>>>>>>
>>>>>>> Since the commit message indicates this is a PM4125 PMIC, should the
>>>>>>> compatible string include a specific identifier for the actual hardware?
>>>>>>>
>>>>>>> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
>>>>>>> the fallback allows the kernel to apply specific quirks if PM4125 errata
>>>>>>> are discovered later.
>>>>>>
>>>>>> This can be ignored. The compat is a leftover from the historically
>>>>>> incorrect naming.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +		pm4125_s2: s2 {
>>>>>>>> +			regulator-min-microvolt = <1000000>;
>>>>>>>> +			regulator-max-microvolt = <1200000>;
>>>>>>>> +		};
>>>>>>>
>>>>>>> Do these regulators need to explicitly define their input supply dependencies
>>>>>>> such as vdd_s2-supply?
>>>>>>>
>>>>>>> Without these properties, the regulator framework might be unaware that the
>>>>>>> PMIC regulators draw power from upstream supplies.
>>>>>>>
>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>>>>>> downstream components?
>>>>>>
>>>>>> And this is a correct comment. Please provide missing supplies.
>>>>>>
>>>>> As per the Qualcomm system design, the parent-child supply relationship
>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
>>>>> RPM ensures the parent supply is never disabled until all subsystem
>>>>> votes are cleared.
>>>>
>>>> How is this different from other, previous platforms?
>>>
>>> This is not different. In the previous platforms too this is taken care from the
>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
>>> may have a RPM/RPMH regulator as a parent.
>>>
>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
>>> calculated based on the active child rails. This was done for all the
>>> subsystems (including APPS) regulators.
>>>
>>> So no explicit handling from the APPS is required for parent supply.
>>
>> You are explaining the driver behaviour. But the question is about the
>> hardware description. If there is no difference, please add necessary
>> supplies back.
> 
> I understand your concern about descibing the parent-child relation in the
> devicetree, and given that we have been almost always followed this for all
> the previous targets, it will expected of us to add them.
> 
> However, we want to avoid the unnecessary access to the parent from APPS.
> At the moment, I do not see a way to avoid that, if we add the parent
> regulators.
> 
> @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> parent-child desciption, but avoid accessing parent supply from APPS, as its
> Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> recall we had a verbal/offline discussion about same concern in context of
> RPMH regulators earlier).

Can we introduce some flag in idk.. struct regulation_constraints, make it
skip the parts we don't need and set it for all regulators registered in
qcom-rpm(h/smd).c?

Konrad

