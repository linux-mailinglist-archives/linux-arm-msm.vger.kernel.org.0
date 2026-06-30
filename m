Return-Path: <linux-arm-msm+bounces-115458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fdd5IlPOQ2r7igoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5026E5410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:10:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OLJe1G8j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MtrHT8zV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115458-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115458-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16268316CC12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87B1423A77;
	Tue, 30 Jun 2026 14:02:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F66450F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:02:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828130; cv=none; b=OioOa66tet0MlCamZw03TzwfJHj1rWxJOi4z5yg2JpkKMjNK2yPmTA14VbYpIjTgbgQOEI94X8cfkjzEUNZus2A3dXjroXAyIkeVH0rIcXCwLK5Xaxxmd7ipQ5APQWOTFkOE/4gq4QDbq3DMa0VYEWOiB5YsQ6oY7mdw+7pyhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828130; c=relaxed/simple;
	bh=wFepA8lChInmQE7Qa7ZSldjWP0jFQi119n1G5pjN/Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euw9Y6E+axWgGhjSm7puGdO0Qej0XoVsfimxt6wXrDlO+gi7hxS3YutVU1TImJGtzAWd/dU+fhnftxQ19kuVAXj2UfVDDBV/N5BfauC0AbC2r/J0xjL5/sjp8GCkuJE3RfkavdE3H9XUZyZNW3CBO1nRmZdyja9SlSo+X9MjJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLJe1G8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtrHT8zV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxdG1604722
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=; b=OLJe1G8j2+rLPLkq
	rGD2eZB0wnyPI4cG1+Bp3SkmU1h53hXnTcXSScYoiKToQMemTQjS9KjTv0HYqilP
	iU3fBWtusysB50/wrDCK5VeVr+BTpmP0evfcHxx0yVqavVpfBjECoQL759UDkxI2
	kNC9ldybFv43iTtkhrEj8SsiMeaxhvy7xcFbfc+zVvr9bW5uyaqrYD2ZNN4amMoW
	ctcqUCs5YpBmPkbBSK2RDs3yp9CXG+Mvw7XLLX0JuYqrCUufqE+7by/Vlo5ULAeG
	2O7bb0s/5v+NGmLlVFWtF2/udhoNaXyQiG3TS1J988D9wSWm1+qtlEteelDti9Mv
	2a5A/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fjjks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:02:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so3557061cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828128; x=1783432928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=;
        b=MtrHT8zV7I6XvhVq/VXe2AhxSigtUgcpcGV63eUk9QlWsUz2sEeSseP7xNtya4dZOm
         VfiEAtz8A7yRvhby+C/xnKytD7D/4lfG/CazPeeLGYtammUvCZ32oqk/ccUu04lPZ5Mh
         DS2uMTBr6IdQXPqOIoKHSPD8+CVOsNQb8c9NlHuEXPb1AQStPdICB6WAJvSmOlE1u2IY
         BL6ppEdseax7mXSW9RrDO/aAT+mtGfxwGp/xxsCiO3nqFB5WHqUWkO5LASl/P7fFjJNB
         D5J3Xvlm076I04nkv0twxF7XzYuZYUXAX2PMK+CN9uvdmzoTtG3N0Lw4lHsHeSk1reqo
         zvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828128; x=1783432928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=;
        b=E+vKSunsCg9PVf3pXaev+rp1mwoOxdjOlUPvklwaCjPG6tAJXcg7gOaO1Z0a363Zpl
         t78W7z6ekphWlY4gTwy3uQo8IVGsx24lTByKDFBgaudt4JpWUOXNieRay6AYvrfMfQSR
         txx8Q5WL+dkgM5XdTjnBQQj1xoNMAPZko3uaR5p4UNifOM6HyPGw+2S176S8olE92VyU
         Uvfdm+UJnE2eyiUcxg7WRg9PF37iV84j4ndXmTPu1Gxj4rw7t4w6TwkKu3LSDq0VpCq6
         4Ul8aiZeznz07j4W18Ba5cRx/HRgRij4nm9SxzyUp2JHs2ZYmkc0vxJF9iZsBVVXRBht
         surA==
X-Gm-Message-State: AOJu0Yy5Gy8P8gt2XBTNZNpExl+nlGrduXp8O5Oix2fvAARpvTqqzAVR
	zaol06cl/45j97wfuODHJu+UwLvJ5YHZQxT/EFeCvW8IhKYOm0XdTvCYRc/g76sscoYAM5kmxiT
	16r2/GNy1RguIpvyvLv/0xZd254iLCAZYK7CT+nyG719RmSYXQeR/p7SUYpZPvhdxmwkW
X-Gm-Gg: AfdE7clBpVki4+f0gbkGKJdeQ76vpTPq+INeLdc/qAIbKt28M4fXCbmIDBeUxONJ8cB
	Mj/u6ddLAeXtEKZPJdlHzaLNWUk5yyX/JGp3pVt21whSH/VqSfU3CH+ZRG/YIJMiQAmkEwH5dSA
	wOJSgKqDzNuPgPNi42M/XqeSCIakv/VjBrEpHa8T7O+JTmPDN+oFNqBHhlWv6tVWpjXd/KOcDHw
	atKjmcYOTd+EWlAZtY9cDNwJK5dyDuhLkf35YbQVIF9M1GZh6y0PZf6zLsyivIYEtQI9Y5/VNgQ
	9yB2EvX4kSh3tHNNEjz8+t2qHa+TaaXrLgbR+ZW0JG/8+PEsxF4B01eKclXJx5BnX9Lw1mvEeIk
	wg6sTigdjEaOwskQdW4jtPRrB0d5c/UueZpw=
X-Received: by 2002:ac8:7dc4:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c1078dae4mr31674001cf.4.1782828098318;
        Tue, 30 Jun 2026 07:01:38 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c1078dae4mr31616421cf.4.1782828044057;
        Tue, 30 Jun 2026 07:00:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4b1046sm607897e87.81.2026.06.30.07.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:00:42 -0700 (PDT)
Message-ID: <37dd1dfd-a3b9-4dfd-86d6-20ec2c80630a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
 <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
 <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMSBTYWx0ZWRfX6a1MEq8Lnfmv
 FIUsEtRa9jr1wbueApxbkwhc8qD4wdUHevgB8j/BSRliW4Hsb0gwDgJb2sjFJSE/hKkQ0JgqyXC
 5yyLh+dkdNMe2ehkZJQ8A83xwOBHy4FQosAhML4SBjvOfcOzMoqGyGMKCD1mUBMPFRbSanm16cs
 R1nL6EQ2ivvTg4yDIEB8JV6sn9rRmfcKJvqGH8mjNpyBz4H8S+CsSPkSpW26ofahNuEYWtmAocs
 /B3m44n1bnkMwXKNhRt81OwprtFhFRjbttMGPhNzJ6bDHoczCX2TA4uM6+UCaDPmULn6seKKsJy
 CcGSr31rrAZS2wSCQXzO8PMyGrz+zjy8gmEcszb1U0/HTLNlE0cASuvvVZx5mDgD8ZiiGF+rxcM
 CcQmg/u9AxS2uKbe2654jKHwPztLn4MN9Hrs3GNyQ2ZBnLjRCJY9ju9CgtUzbCiIRaURLT9tgKx
 vSfb9GWkgLX4rFWeodQ==
X-Proofpoint-ORIG-GUID: VKXBLA0OMYaE0glMkkHed7gOJYbxchUo
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43cc60 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hCizUYdsW4M4JRnaFA0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: VKXBLA0OMYaE0glMkkHed7gOJYbxchUo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMSBTYWx0ZWRfXwnCQpadx7AXf
 lVQilNjmBzD5o/TljaoPo1/iGzGg+8LLpr8QMqctLuGht8tm8tiOls8rbBmKpaizJuugLoNdSoG
 b/iQmPSyyPdwLRxK6wAMw4OQ1ZrwBLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115458-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:yepuri.siddu@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5026E5410

On 6/30/26 3:34 PM, Komal Bajaj wrote:
> On 6/29/2026 8:04 PM, Konrad Dybcio wrote:
>> On 6/8/26 3:10 PM, Komal Bajaj wrote:
>>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>>> EVK boards using the WCN3988 combo chip.
>>>
>>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>>> EVK boards.
>>>
>>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>>> with register space, interrupts, IOMMU configuration and reserved
>>> memory. The node is kept disabled by default and enabled per-board
>>> with the appropriate PMIC supply connections and calibration variant
>>> selection.
>>>
>>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> --->  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>> Split the SoC and board changes
> 
> Sure, i will the changes.
> 
>>
>> Should most of the board-level changes go to evk.dtsi, since
>> they're almost identical across all boards? You can e.g. simply
>> override the supplies in the IQS EVK DTS
> 
> For wcn3988-pmu node, I can move it to shikra-evk.dtsi and add the supplies in the board DTS files. However, this approach will be subjective to per node, as other nodes (such as sound) have board-specific changes beyond just supplies.

I meant the board-level changes within the scope of this patch
specifically, yeah.

Konrad

