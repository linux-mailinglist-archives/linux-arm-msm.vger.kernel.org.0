Return-Path: <linux-arm-msm+bounces-91499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAUgFVKXgGnL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:23:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4391CC4FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D106A30036C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 12:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9072F363C73;
	Mon,  2 Feb 2026 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl+Cx+EW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpFBcRrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF343365A0A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035009; cv=none; b=qPdVXJ2FUi1ZQ1v5uXsU7oBhJRd61LUm2mAlzMhmUFv0SXBD54tD7cS98Uwo2uMUesibEUZo2sKWswRPJWJVwwaqL481FApJHXBs0cQm9h3BO2PNoY4JdBS9kWuhsnb6RIZ7x3hph865zS/etMM8a9jtngJgdBJRYw9ZzczieDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035009; c=relaxed/simple;
	bh=+DKcwC7NTyCA/gl/ZDQxs8wO8JKKEH25qMtNu7FO14w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baUooY/nT6XuEGgd6TsF+tymkbErCJg4fAwnN2RJHABKyvSpPOnxtw38lBwrjT6TYsHzyGbMNHno7m9uinUcCRmUaBU2JQ6KNAhKwuwspB3m69+kENpL9VQ0vWuFFbrrMqwK5eWtAgQ//sVXHc5KGxbk6WQKmVXyf+uVC8w47NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl+Cx+EW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpFBcRrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612BARi43082919
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 12:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0UJBOOi/kAh4rFVu3QvP+gG227MJiiG8UbKLGyofKI=; b=bl+Cx+EW0tTwB0Ky
	TN4KbkMMUBLdNfUxhSlRcTV/+Qnxpb5LcZ7ozrdhUuKtDcrQGgN9n8srBhg12TcT
	fn9uYlhsCo/gFBiYKWPhF7cZsXwDfCs4IfYFeQmQwdf5tTxueIbNxSbcbx6iTY7I
	FZkhCTEcSnV6WW2mDfc2ZpCLSpCbj/4vtBjVrinhkO97W3Wp3c0k/2ict3YRU9D7
	OyhQugSlwJr/xj6AZ/X+hMw3ZhFMCnMJLzvM1uFlyKiXEgu+TpoBTxtKB2yys+WZ
	7tLpiezSHP11+v4i47PZcJynj6cHIKXXgl+hIEOIdZVpzrKWVoOwuqygeGWR46eP
	/AHkDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2ttn060g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:23:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso94406885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 04:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770035006; x=1770639806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0UJBOOi/kAh4rFVu3QvP+gG227MJiiG8UbKLGyofKI=;
        b=OpFBcRrLBm5XgX2PKzmVaLxWC2Fee1K9c1X6ppE7Enc66oqWBcoR99/mdJsyvCOYoe
         hcyfmhD0DJrlixJkY2+heh3cruoZ2/pSL7IpkRLM1BncE1xYQp58dZu0yEBvqix/wqyy
         DM9JFxEE5uYudT+M3dveLhCm/rUu7Ct/+dHwzmHFhJvqjLGmmX37kAIKnFGp33nWUoZF
         2MA+ZfI1grZvwHh/2xpitAty5TIqlhQZpMxrvblAqUFNsMnDousKT3XWOQ26j92oeu4y
         EqxqN7df2a55XdnEYpRVu+uNzp4g1xhXd/fp+T9YHta/+6AfFKCOpFyQHA/My8UiSVFi
         6MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035006; x=1770639806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0UJBOOi/kAh4rFVu3QvP+gG227MJiiG8UbKLGyofKI=;
        b=CqrYkr81NSGeHrQtWLXYVcjRwVrBGRvSZ84Li2qKoasRM7sz3FNwaWLL1kCs0l3WS4
         +eIe/HeCZSPy8wUcBHu7roWYkP0X/M0cCZdo4fTBc0teAKQcT4f0qIcbXwrfVUujKRFD
         +cUk+GChN1X1bCtlG1E6q2kDgjF2r398+Npsx+LfOnpDiGgNctLsGqA4C3FkstgKi7tb
         85IEisT1YaCmYvPLkEVmxZ5oB9hyvprYZzcafZUpDqK8Z9a2FC0f9W0Ka7ervLCT1NJB
         Zs+je5oce35q3hCRrN1mKoX3GQPCkZ8Eg+NTx0khoZ2l9UvITNvabZk5AAproWAhEml+
         4gJQ==
X-Gm-Message-State: AOJu0YzcSX0NbQJYTClLgXuYOPPLnw7cB2hIlYGaBTKAHWTyZ2m2cMzF
	CYRRmF7MN1lRhuPJZ3LOf4ycRrYqEId6zR+ytHSnhZsWuZ49K2S0wk0Q/erTgoOD6SbOZ289nCW
	M1LrHE5CzAzI9FpIC9eqsTtE5FlZatIxdUh62FOOZUBCE9OQFxWfsNrqYPE91BIjxhcHh
X-Gm-Gg: AZuq6aI7eJDcQLOGgr8TF4XPyQNFB4G1S7/B1VQgG5jVOAM1dlerJ//ifTaPqyj9Qet
	UES+Zb+XOvIxxZTgLzoSNV4Nv7MsocVhwhbNmOAxE3a4gByBLF+CZKBpfSO32V3G1MFIzgQkPRt
	LTtvYwuPe0G9JagCSwS4MS/ELOeUImILk7oln1x74FlTCrNrNR36hFvnUQJ9hNIwl7otwmc1AQn
	oghKNC65MOfbsmK2ekSz+p8bDT+jc+/bvgtYpD51QgSXXo9QAOS+NCMKb4DBZb7nI6BiMSWLGGH
	4jR0wXXvTgPaTQABr+agBMF6yZDwZCYsslBE2cupBxFF4/9FTLu/SydStb4Va3MB6D22MU95Fy9
	WV4JmI10BAumuh7O+dK1ZGBHmgtxoRv49bfS+KkbBB9abHo5vM6M/UUlX6VGho4PDkqk=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1206558385a.1.1770035006095;
        Mon, 02 Feb 2026 04:23:26 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1206554785a.1.1770035005433;
        Mon, 02 Feb 2026 04:23:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a92sm7779349a12.5.2026.02.02.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:23:23 -0800 (PST)
Message-ID: <2a19de94-8a5a-4fd1-b15a-9b76ea5076d9@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:23:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ANnNY0ku c=1 sm=1 tr=0 ts=6980973f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5NiBTYWx0ZWRfX7xPxtQy1Zmc3
 rD6JdAPnrT3i2YuliUaiPbsr+KoPDC+SPoPAQZiI3qYQ/IvP846PGE2bUpgf632OMucpwZeGthl
 M8qsZpMaJimKMQZ3kR7iAPxpNdjgE9DIuhC+wOQwoAk/8fR3wKWulYGVdtcZlP+lg4tDkC89cac
 B9flJ7Hb0Q4YFv5JMn70DpfP64syUBBwjN1bbxTt6VlzreZuOOQ/oBapiD2HSBHkaQE6k+5yeM1
 gWeiDl6EcZxVyh7M2nCtW56vHAmVDHylX7AqKxn6pYYZ4s3sM+0B5WUogU8SXzQg+eUy0xU+RYr
 jq4h1QGhsSuDCBs0GwNOrSDcCiwm2+tHgkn/MlCkAQB9UWxAVX9fa0cSVJD6IbqgygC24b8dkF3
 KDT52jJwxOL01A8DejzUfklINDJ9BLO1jAAgW3MyGPRQSNVgnwjpKKwcp6JkJdCu6imHadzIXAI
 /stUk62aJ0Z30qDDDPw==
X-Proofpoint-GUID: c1uHv9DFBTwLrDh3crMedVjiR6lwRLs2
X-Proofpoint-ORIG-GUID: c1uHv9DFBTwLrDh3crMedVjiR6lwRLs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91499-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.131.57.192:email,7d000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4391CC4FD
X-Rspamd-Action: no action

On 1/30/26 11:44 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 112KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v6:
> 	- move to mmio-sram and drop the Konrad's R-b tag
> Changes in v5:
> 	- No changes
> Changes in v4:
> 	- No changes
> Changes in v3:
> 	- Picked up the R-b tag
> Changes in v2:
> 	- Describe the entire IMEM region in the node
> 	- Explicitly call out that initial 4K only accessible by all
> 	  masters in the commit message
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..90790f99f0597b63801d4e07b9b72cd372ad46d4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -697,6 +697,15 @@ ssphy_0: phy@7d000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq5424-imem", "mmio-sram";
> +			reg = <0 0x08600000 0 0x1c000>;
> +			ranges = <0 0 0x08600000 0x1c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;

I think you may need to add 'no-memory-wc' too, in case someone uses
any of the sram functions on this in the future

Konrad

