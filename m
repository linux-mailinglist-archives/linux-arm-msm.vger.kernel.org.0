Return-Path: <linux-arm-msm+bounces-113257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 427FLmxMMGonRAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 21:03:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE468959A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 21:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MXb6G1hN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LSMks5SZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113257-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113257-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CB8F30B036B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFDA30D3F3;
	Mon, 15 Jun 2026 19:02:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37F29AB05
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 19:02:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550164; cv=none; b=PeXGRrZX0LIfQhCk7jRw2UGVL8BkEHMZILjr6sK7rHAY0bxfC8uH/XVe4yVSSfG/AmAEFX5l3ICDflH+5sNES06Vut+mfluegjZna8Hx+VliB7dyVYui8JctycGqyciPKumV6B8eOq0FLzAzTWl4h0BrkFgX+dqvv3pjt1xEYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550164; c=relaxed/simple;
	bh=/M8+n/5UrKqJh506pdRADgednbbTX8KAPo50ezwOXxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwZDEGsY7wHynue+KDaJM0ZiEK8oHpBdVSrQk3/49ByLeMAlj9LnhMWJP6gH09vIB4FF4wBe9umDM/nExZMWwLO03tt/EzKuqFbRLSKoWMA6q6nd8vMLrbaOiu+ai30Dd6D7PCu52soEAe4pcj7n6pumG17RawTnzjap4i3QM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXb6G1hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSMks5SZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ12Gh1453984
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 19:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCIFI4ENSoLpkomFqMplNv8XY2zjIcdh+jKpROESdcI=; b=MXb6G1hN8qxZzW+u
	znsZ/w75fufoCLHLgjLOOblNrlx167+HjgU/JFD7gZujQhx8jVXMK6b0bKdnUd8J
	OhZzKxMP1Gi0PdMgGmTpMqF54XprE1aUk2xyZWYe6hqBpNzDiFYSou73NHZOZ7vG
	a21friFRpoekX3D60ysB5pgObieyosfot+1G8lQ0ke+J2NBAasM1GlAglWVVh3GI
	Tce8x1g+43BPvZ2Zn+NHb4PBfKF+IrFxEJfbQV7EK9KLkFS9pTx3CkYMN1qQC/pe
	zSapHwSLhnYKkqU2oevDgNOiiUGKKCXSrHO0MbOKB44rSeMPFWBgB/J311aw6/MC
	YldLOg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cayp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 19:02:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3075fa5a407so6779297eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781550161; x=1782154961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LCIFI4ENSoLpkomFqMplNv8XY2zjIcdh+jKpROESdcI=;
        b=LSMks5SZuziMYWNd05E9pTN2/xsuhqXp86jRaAnwYT+oJYBcqctQUzI+qCYEY7sgbP
         zKy/JMQEsUp3dJh0MBJda8bZCIswjT2MttB7rJdsBgFPNKpk9gNSoqNDUOqaJiyPgK3K
         cPEA9Fqd/KzRzEDM8d8wzObBgi4cpOrM3jVYH8CnRzZrdSNTFrOsxlhtEFEPJ9CeOo/u
         ZbJVNou1cke6drzLUawRBrxPbjsJSZqFaC0SWw4cvcfqn7pqFsskDgznqNskXeWx/9sO
         UAON5CfKa951KwoQeQ1fxgJ3O5CbpApP2x0CfDVLfNWPlVF2zqOAC+C8mIWxavsLTOrE
         +W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550161; x=1782154961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCIFI4ENSoLpkomFqMplNv8XY2zjIcdh+jKpROESdcI=;
        b=CVEr4c5k76bUlf+4Y4GAI9VF1x8uye5T3/OPbZL3tD6eSQPP8d5E0W3i13QSbA14LH
         xpukDQdRUYJHgLW3/d78WIBq8e/VvdJlnIppHTgK5nuJiXCjxKLsmDQnB+4ETJns1rE+
         pmqIRpCaKmuVxsip7CsalC6b2YNiJ7Wz+Gt6pcgEdSrdeB3hIbc6noqGgzeA4sGvx7Su
         3FyPYgiasZNKeK80LArJJF0TF2tbRIwSBQYNq58oa8buEX9+1F6iubagXkPwyPFL8IMm
         lE1evGf8g9QFz/rLmXsxH6UythRexIIn/khEjD60RNgZ7drnhHUuIRrt0l3QMk3JJqR4
         64sA==
X-Forwarded-Encrypted: i=1; AFNElJ+UVLQ9ICDl6tyW2cJ7X+lJ75Y1DIRRO0XF/O9acoJZFdPwWWp552rAiKW6b1jBEkHmioq3JoXs6iDVJNXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwTYRQYMHMr2Pv/8CmrzyCILyk1kUjn4xEuzPEAH/PvwxEwDIft
	OxUGwjZXJKPd3KG7TIsSVaihArT+Ra42ceb/S3o5b0EDeUOvkLB0Y1DWEYVA9fUqQPfsYVJevns
	plXqYQSPsY18gBiQhSotAzD1yttvT04dJ3YC6Jv7Wrc3zyLnpw4x+Sy8Lw3DN98wSkOl/
X-Gm-Gg: Acq92OGH9PP/brWp0W8og7p8bpPZNHMNEMIah2Xhk+U6AQFtOYEguL6g1dcFTew9x0s
	SVuNm/mb6koAP1LtqKI7wP3GSVZYDJa0xe0dwETaQwFU3GTfw4omDw2gf2mOgEO6OvoSaJtoJ6I
	VoLud8p+Yp3IO2SoGoMQvMZbw/k9Dh6XZq2XpSaBp2tJJ8qup5/l0Lckg0yNaAeAFPrTnJPPI3T
	v+T8wDZG1wFtuH9ptn5qtKGmDxml6Fomm9QIYfaFLJ0IchYxZ1zb1hfCstFFEPX8W/4kCdypc8V
	mWM3+EIVE+vQTMhACfLEEMm6cUQakcx0vUMpF/VOI3+uWLSJtbGo40vcE4CVPtYRZkwr0QaPdP+
	OBGatb0t8ac5iNJf2kmar7SqZeqwl5yW8Zz8Zeye5TfMuV8Qm2exgd4Ch7JtI/EnACWMaz5T43G
	rTQOCzjKxpM14fbA==
X-Received: by 2002:a05:7300:542:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-30940075f68mr7135066eec.24.1781550160566;
        Mon, 15 Jun 2026 12:02:40 -0700 (PDT)
X-Received: by 2002:a05:7300:542:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-30940075f68mr7135001eec.24.1781550159656;
        Mon, 15 Jun 2026 12:02:39 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.240.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e920243sm16062283eec.18.2026.06.15.12.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 12:02:39 -0700 (PDT)
Message-ID: <9569b594-a4b8-4e67-ac61-5eb2914bfc76@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 00:32:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
 <20260527-lucky-porcelain-bullfrog-185f1d@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260527-lucky-porcelain-bullfrog-185f1d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfXzFQ60T2zIuMT
 QE5MWP5FZB/qYs3WK4HGCoCgMk9iWRt8aeF5323lBvMAd3CigmjX4F3eCW0+KeCATu8oEbetqOQ
 H0/FnxjydayXCmMqVRBQ1mrgGOCeFEkf6JZGdfhzNNbQAYx2MOHMLyHXKKS8tJjn1HqLEt7u+Yw
 Y4sb9hbFElLwnaTf6BLyP+t4H2ABOlxa7V3in/CNAInKcccvzFeI2yHUQu9ZSZABd7jp37XdI2Z
 gQ5M7gGWkiD09vWfGQRTvdeZvm+PBxBmzLpi0dmtF8Se9K6SG05FjfHFo5fCzBTOyrAUcKbdc5t
 zJwJQvalX7O4TfXlmcsfcEoLCfWsZCJtVJfZfYRFZ4W0ry5jfAdAp8ubnTS932hYelwvIz5kJAm
 f3ORPkQX0wwKCwrvc0WXmWn10ybwZqo++ajrwE2AyI5rk8A055ow6N+uxLN9GP5x6ossQGtGDW8
 XbHzu/Vba8zGRuQcBlw==
X-Proofpoint-ORIG-GUID: aNLQZP5pQDvZQxntFNJh0Jswjfs56qOB
X-Proofpoint-GUID: aNLQZP5pQDvZQxntFNJh0Jswjfs56qOB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX1682ggWGnsbl
 c8Xhad6jz97cUQnpyzRZWl/oIw7HRi/0DtYRZrAGHenraGzvhaQbhf+AW8VbHiu+AzrWYmAFYxk
 k201s0fkgsUNWD/kvTWjTYhb2wgALmc=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a304c52 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=6oJ3Pe8WsobediNJCW6FeQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Uytp2g_U9kgvtl5AwR0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113257-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:pratham.pratap@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2DDE468959A



On 5/27/2026 3:16 PM, Krzysztof Kozlowski wrote:
> On Wed, May 27, 2026 at 12:13:59AM +0530, Pratham Pratap wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Declare the USB QMP Phy present on Shikra SoC. On this SoC, although
>> there are DP registers, the required internal pins have been removed
>> and hence DP wouldn't be operational.
>>
>> Shikra needs 3 resets (dp/ phy/ phy_phy) to be asserted and de-asserted
>> as per hardware recommendation. Extend the bindings to accommodate the
>> additional reset.
>>
>> Use QCS615 as a fallback since the software interface is compatible with
>> Shikra.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
>> ---
>>   .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml    | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> index efb465c71c1b..65ae4c6e09db 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> @@ -16,8 +16,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,qcs615-qmp-usb3-dp-phy
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,shikra-qmp-usb3-dp-phy
>> +          - const: qcom,qcs615-qmp-usb3-dp-phy
>> +      - const: qcom,qcs615-qmp-usb3-dp-phy
>>   
>>     reg:
>>       maxItems: 1
>> @@ -33,12 +37,15 @@ properties:
>>         - const: pipe
>>   
>>     resets:
>> -    maxItems: 2
>> +    minItems: 2
>> +    maxItems: 3
> 
> So QCS615 has three resets now? This needs to be explained in the commit
> msg. Or fixed with constraints, see writing bindings.
> 

Ok, will separate out for Shikra and keep only two for Talos.

>>   
>>     reset-names:
>> +    minItems: 2
>>       items:
>>         - const: phy_phy
>>         - const: dp_phy
>> +      - const: phy
> 
> Not phy_phy_phy? Joking aside, you already have a phy - "phy_phy" - so
> this is not correct name. I don't know what is the correct name, though.
> Please consult device manual.
> 
The resets needed on Shikra are:

GCC_USB3PHY_PHY_PRIM_SP0_BCR
GCC_USB3_DP_PHY_PRIM_BCR
GCC_USB3_PHY_PRIM_SP0_BCR

Hence named the third one as "phy".

Regards,
Krishna,

