Return-Path: <linux-arm-msm+bounces-109310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PFgGvpKEGpvVwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:24:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D83EF5B3DDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C66C30F4255
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F22037CD3A;
	Fri, 22 May 2026 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FugQIAt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT0CMmra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D2379998
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452084; cv=none; b=bpvp6VmKjtS28UFsy0zQXkvnE3cr51vEri0uskYJMNPfoM/PJkefjHL448W9mml7iq9SXaHbzOev0schUuPEo1qpfMGg57ZGsqtDCEgRORyxKkmt7/MX2SMmCTCVMtSPtQoQ3ujieHuEEQaFfwgbsT3ofVRAPOUSJL+g3fpAFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452084; c=relaxed/simple;
	bh=BoewX65LG8Pdfndl1vDtiqts2qaJrLH8LBPXD1duB8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGegxwj/X1bESnq84lxG0bchpf6VXnl5eFerF8K3ZcF9wIvekKJV8ocnj4+c9SOoL6+iZbHLKdLql2i4uSv2x5jEWvwlOe8VQ33bApswR7qpxs5U8D3kwy+4Hi2RvS27uaglJDexQiulND6cGVvdZZhCnFXhQr/GM1rLTetZ4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FugQIAt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT0CMmra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7WvEi778902
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=; b=FugQIAt0Y0vZOnpn
	3T4xrzy0T2ZCd59gvPtKOItV3Z6562kZxq6ne01WslIBDaqAwycNCG+jBxqLG3fD
	76TRkOJ7WqqH/W8YxcNQ9jyci2SYoO0DDv356X80oj6MAoAiBLco0NwYRdkm5TEH
	Mxt6oUoE2ZdQi85xeRce42m36z0uJEJztVeNOjRYlWWk0+7FxW7wUAovxXm5LmoL
	y1vwJe/xPBlAeplVlRb8Nn5jiHZBIjZsvA1rnWLxUQViUUu+mHM8hoKaPo5Hri+1
	1w9mNh1G2rqFbOE++tWXIQBVfo9wj2WO5agXSJ72Jw7exjsuR1CX75tkvtXtVmb0
	xPU+yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atnbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:14:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914ae48993dso36649185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779452081; x=1780056881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=AT0CMmra04gdQS7TxPA2TwODQeE+eEjKn3n/pccRmJXWHN8ifSEAgznU3t5ZLpV9qp
         K+H2QGLFOPfxNLg5Vai0PV6eEvgrOphRn4nhs3ttUW63mikqjFOmmg++vgz/H7SfXDFF
         iaZRB78MTWfvLQw4U94T8ObQIY5m+YvPeHTX0NKK/PbCyhiZuAuPDlAEUN5ymqdGj1vM
         w4MX+ieVTLSTkqCBTHyFBpgG4khz/ijEh5SdswLfleNE6FQYJ37L515Vk8mR9b9zlMTW
         OXPAxVhFhC4JA7Rk1kH3hYivmUjoYQzpRUkc5GnD1Q3iwGqkBXEogIdVrUOuN6+aghrL
         ksBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452081; x=1780056881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrOX2NAuJ/71Lo50yoEFGRol8WMdvMuDoXrsc/R/vY4=;
        b=meHHjz+76o53movXUUmXHxPUv6cTZsjIDq/huKp0ODI67eFJfaotlYj92P2fzt8l75
         vWVCjqHWXUO0/4jnib0Epnb1FzQXtzC2BRNpGfJ7qxw7LsMNgj+aIvKvCHsUvE1lA25L
         zEWV4949jkyxDj8PZy2Tcf0KnvgoxQQnpZD1gO09CVcoUMD1W7mEdrPCypXQJiU4E9e7
         su6Lwhf1dxyuKVNv6er8rq4w+mx/5mZApcEXcHltuiSjCFC6spsGPvmBotQ/bP6UmWhS
         ofUM1/E0hyGSpNtk0uhfn/Wz1g9R/Nh0yEiyBEOJWH8pLy5gQZGSjxr1M5YT71yxuJAV
         hRYg==
X-Gm-Message-State: AOJu0Yy/swBShidHdR9PkrktzTwRgp50Dhck6rRu4ovmVLjkdPzTM27V
	nvrJBAiYtX1e8XEK3vCC0xJtuH5SyOq5T4IBrbndm16Ec2C8zwCt6iUK5rpuwT1I7/Op+OFHRhX
	WzE9jSuydq1ZBJRNjM/md9CWgMWu26/IQhK5PMe7UN0O4WwMiZ9gBjw7eyzdZ9cznlxl9
X-Gm-Gg: Acq92OFCaGYwNSLevXki1v1HDQfeC5nZ52zEghuO4SBWCt9iNtzRVERVDDU2Mhed78N
	7jC94udX7G0rBdkRFe+BJOTDF1LxwBEwkFPR7W3wk/W2f3k5rM5hZy7kjRVkobHroO/0ZXavAa0
	0bvu9wjO0Qp16Mai2zh3H4pMrbtafbLfpOWqLnqGbZPaRT6+yeKL/ote5ttf5UHcEAwtJCm5z+F
	P7ZefnWRv8zGofsyWGhO55NBxfFdI1Zlcj7CcFOB+94ZuxxIUnaiKW//p6IAwRq5Qdxr7pLsWv2
	1doW1o0JgnQD1i8RzAww451ZLK0nOV5dMTL3o+hXbfrAbozqSMLtdS0GqVqyqWnndlR0Ow6TlpY
	82ULkkAfWeVxyJqMcFQZDoj1iKNkl6yH6wHF4ESb6TlKVNg==
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338175685a.6.1779452080924;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:914:aa0d:aa79 with SMTP id af79cd13be357-914b4a2ac9cmr338170285a.6.1779452080513;
        Fri, 22 May 2026 05:14:40 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd5bsm50436466b.5.2026.05.22.05.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:14:39 -0700 (PDT)
Message-ID: <5f5950f1-397b-4a7e-b88f-b6b74388e310@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2hDHQj3TFmtdc3WdfcH7CP3WcLHuqmPm
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1048b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2hDHQj3TFmtdc3WdfcH7CP3WcLHuqmPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX/1jLyPWjmCXi
 7rrVmFOiZ9ZdOutRcDD97QoeUeFSsj9LFRyETSQRvEfaWMEQs1STX6Jccip25dYd93uoLNlTUO9
 zZZyASDR+65kksvEg3FrcA/+vaIZ4VJVoPtCIQiXb8K2Ny5baJoIEZJS7dYtXWaii4GwVJIGRGz
 L3ZvSQP5bCHEtyNejoby7q7tBCN2QY/xFjyd0PJK8pS/wlLE8WPqrVtdK9p8oD5ozyLwa4f34qX
 XJtw1gokOx4pYuWtRYC9oxRkYoAsmsdwOIfAcERkMlpzybSDHpOscjuZ0u95+VQL1nX7mrZbijp
 ss4XTuZYkPxsr1bTjChSvOFRRcN48Ty0FqvTD2KDrUEaSC5V73HLKFynz422yZZT/D8/kpT8PfG
 G6IEBIrRf756tNabxz1zTUPkMyt5V4CNAQTw41EICW8TPtff24zVjlEV828YhzucQKaWu2hbdFI
 wWrbjHBL56atPEV8yaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109310-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.222.198:received,100.90.174.1:received,178.235.128.140:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D83EF5B3DDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

