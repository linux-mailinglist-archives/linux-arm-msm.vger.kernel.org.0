Return-Path: <linux-arm-msm+bounces-100101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNKyCLITxWmr6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:08:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621F33410E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8226314DD89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9543CB2FA;
	Thu, 26 Mar 2026 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzqVWNQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghehlGiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712173A7839
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522040; cv=none; b=TbbQSxnAevXfyxmWM8JmScFZusSPSCVxUqCe3Ai6mYUdC41VZb5rOuU7gU7WvFilgrozVfpVmKNZLdG2uiE9ou55xgA4OOe4lr4NvPFsJAcZuloXha5nXSTZTpHH7f71rPkJI7hvOCdPedHjsMAMJLhb8y5LqLp2GSwErYKigm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522040; c=relaxed/simple;
	bh=vnOqKP3b/xcO5Ohy/yAR1/T968zsBzBSHlmduAuPUPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UztbU19EOYuqa7kfEPL+SA9Optt96KJwochaDX8ddT6P86vCY7QBrxlxQEMtVb3SYvLCKxxQu3XE6WNSUINz6VcLT5LLwP1FW/w8+IIDvnhisQczYyiljskO+TBkdZEZ9bB91GAwbIUVpCpTySWOU9aPL+TrRHXc1tTjb2aSbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzqVWNQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghehlGiW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7M9kN3069769
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbcoSCCJFYoNCYnsc7ZoTcxqAGoQSeFuzx3hnMuWMFY=; b=TzqVWNQNQpJDLNKi
	Zk92CDofh+W/nedGsJZKDjtiQk91E3efs+ZXBsgqBV4+ULm/tZ9rxpmWPOzgaYRy
	rVYJc8hCyS40tHB+kL1BEN319FBcIGTp0rzMfOjwI7c53GZMSQj82J33LJKMPOMv
	wpEUQQvGKGZ8KfLKQvPoi9Xxwn+eMlELGvaOXujM2XT/610Bclni37pNzLSNlElQ
	kCiHHe/SFq3a6ronoy6EGQsFlXpkM+VqMEZB1F1cNYaYFQq/yiitZiz04ThN6BCP
	DyNHEWjkNafqkJ2jJnxFZZ3gpIOAgTBk7hxtVJfSdAyD5pavK1BoK+SBYeXUGZTy
	wm+7FA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn26e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:47:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so2567926d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522038; x=1775126838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbcoSCCJFYoNCYnsc7ZoTcxqAGoQSeFuzx3hnMuWMFY=;
        b=ghehlGiWR2FpMEwW+QsjrYzC6Hu7JRs0STFNf3cXXBRusRck/+oeTdB4NH3k/srX7u
         ytF2QaDuB3ZIZ53wQ3vJ3uq2QJkunFgWLhAwqAPHqzq9rh2HP2zEss6shF7krVvjARm6
         oFXj0wWQ45OtFbmL9wrMViboW7sCa5OC0KkhE6k48p5qyBLTDNuxorRQMlCW9i9j/Fb7
         /WTU8lwpeR2f4zN+lvglSWtuZi78oh0Mx2NguAu9Kyc+2XKehHJkiHd0sTwiB0zWBphK
         fylQY9RLbvsw0ol7XUlN/dCkMiqVXRgnluAXRBs2FdmB6yTNCLAGONJjWEUzS3nRA/d4
         ajkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522038; x=1775126838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbcoSCCJFYoNCYnsc7ZoTcxqAGoQSeFuzx3hnMuWMFY=;
        b=VDagOhX8A17LstKkAZaZay821lBHRuHbCF9njPWtpfnTfGKY6I5EBEBDD7NJtTSLcl
         ccmRQv4e5H+HfMAvJkKKilZxjMIHlwbj9Na+fwq9IkMzAuYhHI96PiXvfbxwUtRmm7Fh
         RSbX3XtO8u0Lur2BrXBYZnalHnvLwQTDmFbmo4rKQ8wC2VZCqwVqCEE0fRdagFBH/4Dm
         948akhs/y564+r4Oz+kMp+qdUc4q5Uh02X4c0fFSdL0Vc6ycy/v7xb4aOJczWHwPn0qM
         GmPjnw4+uyco18D6NOxEwzNEvllaTn23jFj+yMt298C7Z/gUytYHmxcn96Typbac92sK
         wnBw==
X-Gm-Message-State: AOJu0YxTEHpnJWMnZ8iMjM4W/Wn0GSSjFZ9SQapfB9gKjFqzusjFgVap
	vkLrYZqri4KxXuA0yAa6yWYBLCgC/SPnCgOmtbTD730IdZ1HvDO5/Sm5y4+CfVz+ZL4iVs13AHA
	JyVUVGdLHsdXnMblWMcA+iyuSi0qmSBro9yIAAVpMD6xOQiH0Qr/iqbAd2QG9yBP42/V7
X-Gm-Gg: ATEYQzxnpDapzSkNeC9s7Yz2K8FXbupmXEa7tnj7lk3Sys+/oEOi3kNs68NLkHzL5j2
	ofZaKFplQN7ESbNmEZNu0ZGwa6UAZwt7q6kir2dUplAVZvOWXBnO1kxXjX2d+KyfhM8yXGeyKg8
	C3R8uksfhWEHAPcZJPqHOftMari1cN+FH8yPBthACjyLhl4a+qjakJjRU42XDdIzCLzDlnTGjEc
	EtmiWJ2HiTp7ICUI7cSoGlj6BtFdQ52LwforwXiTWJtH9BnwNaw3k7FSJfmxjHTw+EhHnCRg0cy
	X7SHY5SRWycaF4VKjqlFrSObzyI7Mgb4+wjLIdAp1xWCjCP2aDoakcz5D99OglgME8zQAYMWu3r
	+NK62ORzfSM6GVdFf0a7YcAhO85RjaNWzMym0ZatOUpjb6utguUF0C5PsvwRc4LtCeyuC44TAJy
	ITQSg=
X-Received: by 2002:ad4:5bc4:0:b0:89c:5285:200e with SMTP id 6a1803df08f44-89cc4b3aad2mr77067776d6.4.1774522037760;
        Thu, 26 Mar 2026 03:47:17 -0700 (PDT)
X-Received: by 2002:ad4:5bc4:0:b0:89c:5285:200e with SMTP id 6a1803df08f44-89cc4b3aad2mr77067556d6.4.1774522037346;
        Thu, 26 Mar 2026 03:47:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267420sm102035066b.24.2026.03.26.03.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:47:16 -0700 (PDT)
Message-ID: <41476442-648a-46f9-a9e8-f5f4f7cf7bb5@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:47:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c50eb6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ibZFE5IyWWuyGgHUNSgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: m43SRIFBv5UGDnUlZ8XHNGUtSbBjmHlV
X-Proofpoint-GUID: m43SRIFBv5UGDnUlZ8XHNGUtSbBjmHlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NCBTYWx0ZWRfX6jGd5jjalDIj
 FlRKZtZ7ogaNY1n98R8l0MrRoyXvrgvtip2n1c8UQpYfAwiNnxy3DOMY0kXI/1+cFRPNxlvUhMX
 2kriGCKm4a5zr+Jn6cJuqr21HqBsRi4x91YQW8leRIjYjzQmV8zaI+bPU+v+LfrQgbAQNvOu0ln
 mVnKPT0mBHPvArQ48GVn0l/JChkVogucwNu0Np1Xl6XN0A2II3Zjr6xC2x8vMD9aSpkwbI9Wv5T
 Ie+6Oqk50BpbWWUddzoIMBfMBLsf3SsnlVqMoYYO5Z2VdPQPfYel3CPv4kpqkkxUu5Mnov9fCG3
 k1sW9M6e3TEa1vZHuUb/cnuVYTxwzqXFyqSg5krRff7BBlJp0x6S10BOlnVQp364dYRb0uHeOZ0
 2IVG8lNNQEShbl011sAShA0r4CW9oNOf+KXxnv7q6qsdxBbxJwzmz4N5O9JNzcB2APiG3biYksK
 w7y8ljDi4xOhV27fc4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100101-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7621F33410E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 11:34 PM, Bjorn Andersson wrote:
> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
> headphone jack, WiFi, and Bluetooth.
> 
> Introduce a DeviceTree describing this device.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +&pcie3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie3_default>;
> +
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

In lieu of the recent changes, these 2 properties need to be moved
to the root port node under the RCs, for all of them

Konrad

