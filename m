Return-Path: <linux-arm-msm+bounces-91452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Do8O0BzgGkw8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:49:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C25CA48B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4903B300621C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 09:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDA52DC333;
	Mon,  2 Feb 2026 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXG7YhXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsReirMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F112652B6
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025759; cv=none; b=LdCo2iXcbXkAH+UJOBoDlDaiu18D5CQ+b70N0Kno4lnv2qSDbOp1S+Sh1ryHnrNbywtZ0RESgmrvYcNrgShb3bv44bQzYoLKeyuE0eggBwlWEczd0u193xaZ8RCoOmrTSOc+Uh6Tt7WE61FFYL0YUed9/Vr94Uoctb1aDYuHtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025759; c=relaxed/simple;
	bh=npdn20MjvE1lVsBDaZiowKsFtbn3QyKWRiQaxsl2GGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbCb1ScWo3rK54R/0tIAh3oBFwUs+DmhekFWKGXnR7gG+hWor59QrfJQiM1FqLfTHO3HcbwNzyXlR+FmNDnE+IMoPHdkn5bEw9mIIBKtOQsBLYHvpqO6T3wsQQKz1xMaJkf3p5e1SaZXAiYgNE+DQaD7VsFZpCMaaTq5U/jrgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXG7YhXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsReirMm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612854tt1416571
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 09:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8Qj/Ch23URJULl0FAme6F2TmQo4uKKsxOLUGCh4o28=; b=hXG7YhXhVGZ1FelI
	3OlPt+4JBQ8g5fTQD5F582SLEmNGhjlKuOT8ua5ODbmCKrlRZks+dmPimqzD1owS
	OdvjrOh4Cx2zlzkP154y5AeOB4PTqXReh/8n8EJSo3/26SSQrlKaXtJ5jfGLOHKI
	AFmYaw/o1xJYQy5v8rG76OgX4cp1/0tUB69Ws27jxc7CX0CxSNhD9IrkqLmynN5i
	ryn1/8NBsPKuoh2FEUjnZHhjwWR7nHHYXBQm+65Gn150swIS/yawrkLSHCFBUQkZ
	5VpQCqPWyb+kiG78MUMckmoTmpSBtjdoeCl4JX5ci3c9Q37DNxj5P22oorwe/nAH
	KqB2Hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2mwej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 09:49:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso91260885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770025755; x=1770630555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8Qj/Ch23URJULl0FAme6F2TmQo4uKKsxOLUGCh4o28=;
        b=dsReirMm4ftKkJUHjxsX1hlewK+aOoTqpGHcaElqMpFaei6UwqgGbY2oWFUZxZQQO0
         BiUT6domZnsIfL8z3sFn8aGlnF6iLdfu6YzSyysdjr8lX2xMl0FtjBshTz3ZjN6iGnaB
         IGDzb9p18TJZMZHrtw/Yc2SSntZyTeY7UBLNQvN5y7hq5hu7NNlYR9dZdY6L4ZOKQg3y
         6xB2NqFW8aFBbFkw52F/ONZJnLlwk+Ig1b2Gs1ZZsIwkUZ4RcIRFcX+VIkPC7M0lshnr
         HEiks8eRZsT9QZTa0UTCWpDya74TitDQS4Gxh38MeVFCUI8xIaem6RJNiVvKi+7DfiFg
         tWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025755; x=1770630555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8Qj/Ch23URJULl0FAme6F2TmQo4uKKsxOLUGCh4o28=;
        b=VqCVuCI0VS2292aqhLCkmG9oDH7tljCBDsTKwPZLbYRexY2HMEvB5gAU2txoc7W9db
         UF3trhSSyCYbMMild9oRC6yCvtxAbmkGcE9PVNrcuCL7lVHO+yX7mVxTGXP9pT/kAFvx
         yycFBloXeMl32nf37mU/RP8ZzrEWr7r3TxRQJyZnwZ3NufScSyvMRG6vIdZHnzGiINTd
         HSRLKM949ZsWs5ejBxhL8cZpGYRZ6xh5dsi2+DHpqujFdYsQk7vwaQgL+u9/RH/EiBi3
         h667kMNNClPf517fQEvZjjW09ExnUz8M+3Nh7HLaBEGt9LaUfRY6aCuOh2RkqLUCaXu8
         M8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/x1N/42FYYQYSRzWRV4+0V+5/GY1EZVFpc6gZlJpfgWoqUmoxQEhiFmDyLViyu7oqRt5j7jDgSHgkr4OV@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4O18QchSk7T8Oj8rRzG91+TUbgahsuQFnbq+NDWocyR7z6DS
	UhAETPrkj3QDHUHKCKR2AwNTBrZ0wI77NjlIJQXfVr7vfuZgKxaoBm8UnQKYKU5RajAY1dESiJl
	Rp/bxV7AoOzod6k01k22uuYRAAbkaFklabk0xs7eJ+6K8dplLhjol//F3GKdATFa0O00r
X-Gm-Gg: AZuq6aJebR+zhad8XfWJuzmAWImqJj2GkrGiaGzViUO1uKhETeSn9MIY6wNcmf01BPv
	J7PSUaiU9i9OA7J5Z7mcSVTsyQCt55ya3cD7y0VdQU6jWOjgYdnKOzKY5So38ll+NL5fJmn4Ibw
	tFO6HC6Ra9JdMi2COAuNnI4tjgwcHlbkMnrq8WpUgwpQauO54/h86nMujdDwy+EDOy8DVJIRLTn
	+IZLFaX0LURqUgfiTQEO8H/Chx22sqrGLn27etzw2x38lX7BAlA7UbAjtINaFU/320lqbyPrQmG
	Y/MAwLUbKKOVxcYJj57RQzhLpeNYz1CsgfB+PKv/iXa35Kpcqiv147ycbKhhjmVTDevIfShaJaF
	dU95PY7uUoDzKWX0Z4Lk6Xk3IJFRulQz4nJRZkFfYrl7c7xVCTcacgdxicobBaPp+ItY=
X-Received: by 2002:a05:620a:28c4:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c9eb2f9759mr993858285a.7.1770025755179;
        Mon, 02 Feb 2026 01:49:15 -0800 (PST)
X-Received: by 2002:a05:620a:28c4:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c9eb2f9759mr993857085a.7.1770025754630;
        Mon, 02 Feb 2026 01:49:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e0901c150sm525160866b.69.2026.02.02.01.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 01:49:13 -0800 (PST)
Message-ID: <fe6f4de9-eb9c-45e9-a9c1-d780cc2f721c@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 10:49:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
 <aXtM9vE9y73vnVeA@hu-qianyu-lv.qualcomm.com>
 <6d2b92d0-55bb-4ce0-ad5e-316210a3d2c5@oss.qualcomm.com>
 <aYA0RBA9FjNmP8Ui@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYA0RBA9FjNmP8Ui@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 14dP98vTCL7C9K7xX5dhHB1NNrADG-Au
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=6980731c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=gEfo2CItAAAA:8 a=X8VJAXzcELPveP38kkEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 14dP98vTCL7C9K7xX5dhHB1NNrADG-Au
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NCBTYWx0ZWRfX9Up/9jL9fcJK
 bJey51msSpuSa1xuu3t+Jjnz1ZQizj32H5Fj0yXsoKFyNsdQ5hb7Q6LQSxtg03TQipp6SJatZMb
 W7TLZqRYWJdgNBIY2NcJLcW/4q2KrLHGGMZylc7M2K2iJIck6RZWsrUeefTyoBzGyuYqKiYhgXY
 96sRry+8HqNDCsr7+bY6E0RFbH2r0ZE+xhlzz4p2vVAeKFatRoyaYibMIfcww+gD8L0lzP+IkuZ
 YO1myr0SZshSOoMctMB4X9GAibNVEk5NEXPJQclPj/hjhSc2P7OfPNmS9Oar0Gbctysi5MMligc
 xfhnk5IB6iBWaZtuinSOPezE1+lxYunzKxIMq4QDq+OPpV1K9vFx1SzpQQc0SSR7A9DjYYjj7kT
 F9D1/Sb5C23rxmSVX18b39ry6ayYrkTEea2/ngtJKwZXpH8fQVcH+EltSwPFUpczNf1v2Iqsv7c
 nEGClt4/GpTXpjmyrCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91452-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:url,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,a00000:email,c426000:email,b00000:email,codelinaro.org:url,ee00:email,0.12.53.0:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26C25CA48B
X-Rspamd-Action: no action

On 2/2/26 6:21 AM, Qiang Yu wrote:
> On Thu, Jan 29, 2026 at 01:07:08PM +0100, Konrad Dybcio wrote:
>> On 1/29/26 1:05 PM, Qiang Yu wrote:
>>> On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
>>>> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
>>>>> Introduce dt-bindings and initial device tree support for Glymur,
>>>>> Qualcomm's next-generation compute SoC and it's associated
>>>>> Compute Reference Device (CRD) platform.
>>>>>
>>>>> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
>>>>> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
>>>>>
>>>>> The base support enables booting to shell with rootfs on NVMe,
>>>>> demonstrating functionality for PCIe and NVMe subsystems.
>>>>> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
>>>>> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
>>>>> thermal management. The platform is capable of booting kernel at EL2
>>>>> with kvm-unit tests performed on it for sanity.
>>>>>
>>>>> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
>>>>> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
>>>>>
>>>>> For CPU compatible naming, there is one discussion which is not specific
>>>>> to Glymur, Kaanapali and Glymur use the same Oryon cores.
>>>>> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
>>>>> We've kept the "qcom,oryon" compatible
>>>>>
>>>>> Features enabled in this patchset:
>>>>> 1. NVMe storage support
>>>>> 2. PCIe controller and PCIe PHY
>>>>> 3. RPMH Regulators
>>>>> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
>>>>> 5. Interrupt controller
>>>>> 6. TLMM (Top-Level Mode Multiplexer)
>>>>> 7. QUP Block
>>>>> 8. Reserved memory regions
>>>>> 9. PMIC support with regulators
>>>>> 10. CPU Power Domains
>>>>> 11. TSENS (Thermal Sensors)
>>>>> 12. DCVS: CPU DCVS with scmi perf protocol
>>>>>
>>>>> Dependencies:
>>>>>
>>>>> dt-bindings:
>>>>> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
>>>>> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
>>>>> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
>>>>> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
>>>>>
>>>>> Linux-next based tree with Glymur patches is available at:
>>>>> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
>>>>>
>>>>
>>>> FWIW, I applied these patches onto next-20260128 to see if things has
>>>> improved since Rob's report and I get:
>>>>
>>>> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
>>>>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
>>>> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>>>> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>>>> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>>>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>>>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>>>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
>>>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>>>>         'qcom,pm8150l-lpg' was expected
>>>>         'qcom,pm8916-pwm' was expected
>>>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>>>> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>>>>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
>>>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
>>>> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
>>>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>>>>         'qcom,pm8150l-lpg' was expected
>>>>         'qcom,pm8916-pwm' was expected
>>>>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
>>>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
>>>>
>>>> So, we're still missing a few dependencies.
>>>>
>>>>
>>>> Booting the system I get a ton of errors from PCIe in the kernel log:
>>>>
>>>> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
>>>>
>>>> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
>>>> 508
>>>>
>>>> The system does eventually boot, and I was happy to see that we do end
>>>> up finding the PCIe devices after all.
>>>>
>>> I enabled dynamic debug logs and observed that each PCIe platform device
>>> probe was deferred approximately 10 times. The probe deferrals resulted in
>>> additional OPP debugfs warnings being printed.
>>>
>>> The PCIe platform device probe was deferred because the PHY driver was not
>>> ready - either because the PHY driver was not yet loaded, or because the
>>> PHY driver's own probe was also deferred due to its dependency (e.g.,
>>> 1fd5000.clock-controller) not being ready. This is normal behavior,
>>> correct? I also observed that other driver probes were deferred.
>>>
>>> But I'm not sure why there are more than 300 times probe deferrals on
>>> your setup.
>>
>> I think Bjorn is trying to say that the driver is wrong, because it
>> effectively seems to call devm_pm_opp_of_add_table repeatedly
>>
> Okay, to avoid PCIe driver probe deferrals and the resulting increased OPP
> debugfs warnings caused by these deferrals, we plan to move the PHY
> properties back from the root port node to the controller device tree
> node.

Would (roughly) this solve your problems without messing with the DT?

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index fb6bd545f89f..745cca225bcf 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1917,6 +1917,24 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pcie->cfg = pcie_cfg;
 
+	ret = qcom_pcie_parse_ports(pcie);
+	if (ret) {
+		if (ret != -ENODEV) {
+			dev_err_probe(pci->dev, ret,
+				      "Failed to parse Root Port: %d\n", ret);
+			goto err_pm_runtime_put;
+		}
+
+		/*
+		 * In the case of properties not populated in Root Port node,
+		 * fallback to the legacy method of parsing the Host Bridge
+		 * node. This is to maintain DT backwards compatibility.
+		 */
+		ret = qcom_pcie_parse_legacy_binding(pcie);
+		if (ret)
+			goto err_pm_runtime_put;
+	}
+
 	pcie->parf = devm_platform_ioremap_resource_byname(pdev, "parf");
 	if (IS_ERR(pcie->parf)) {
 		ret = PTR_ERR(pcie->parf);
@@ -1979,24 +1997,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
-	ret = qcom_pcie_parse_ports(pcie);
-	if (ret) {
-		if (ret != -ENODEV) {
-			dev_err_probe(pci->dev, ret,
-				      "Failed to parse Root Port: %d\n", ret);
-			goto err_pm_runtime_put;
-		}
-
-		/*
-		 * In the case of properties not populated in Root Port node,
-		 * fallback to the legacy method of parsing the Host Bridge
-		 * node. This is to maintain DT backwards compatibility.
-		 */
-		ret = qcom_pcie_parse_legacy_binding(pcie);
-		if (ret)
-			goto err_pm_runtime_put;
-	}
-
 	platform_set_drvdata(pdev, pcie);
 
 	ret = dw_pcie_host_init(pp);

Konrad

