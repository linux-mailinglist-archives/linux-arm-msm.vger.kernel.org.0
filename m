Return-Path: <linux-arm-msm+bounces-100650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBfhHt7lyWlC3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:54:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D41354EBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F14F1300F522
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 02:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487123939AE;
	Mon, 30 Mar 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULoe35FX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0Ly25Qn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB23815F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839143; cv=none; b=NmV0800vyG2eKDCavOpC1rlHtP8MgSoGHcnwejzc3EyM6KCDKsZQC5I6CFBgnL/2h2Z7WpWQKy/Z7W8DZOVfXjdvz+KMsz9k5DWhxIa+TULkuZNUH9jQq/DsUpYrJooxqKl4/7D3rWv3Vlb7knObTrrKjipKZNHqYbAI9thaByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839143; c=relaxed/simple;
	bh=sGKgY5fAa0UvVj+12R8Smo+AdjPWqdSmB/Ospg2GarI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mbd3IR6jeQYCkORa1tDzzK0my0jW6AdGjq6Hd2aFpM7KpVKaHf2gEErh2a9RfUp+oFc2V95qJAPeEUM5E3OtyqWObNwalzuNHSnHB13XF+bnuOXLNPH3TIgdfQM8Tts4g+LKU7CZ3H9IZ11N8bh8W1+WT9a6jZU5yOrx0WxoaiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULoe35FX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0Ly25Qn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TMVwQa2248930
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otnhQDCA/EVhv9pthT+cS4OFEczDuPC8D+Xc5fYJuM0=; b=ULoe35FXtP36aUwW
	NKp54fCEpoL7fmGFRwScBLGY7pvq/s+d/HwL2ylvlaZO1SOD0mSK85DasIz2F4WQ
	gl3127FTsv9ZrOJP2uuzGEe+fOZPdHUVHymHyvSXrwowbR9RJuKCiYDA8sth4py7
	33zbWrJ1OUb2NX8Rey+FI58JLGXjs3Hfy+tblSqLrGpfj5gvpHVMcLgacJzb97XB
	NsyrzF30qIc0FsLua57e22+cdaDbUN6NWrihV6j2WdtMLTGeczQxc8OtlWFY4ewa
	0fAPtbXUBWisC3J7BDkbbgMS2ePfz9NaY3QlKgVIhHIrRPRvzLDrgV2WnxNUISSN
	IkaCHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7c48u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:52:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so37885535ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774839140; x=1775443940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otnhQDCA/EVhv9pthT+cS4OFEczDuPC8D+Xc5fYJuM0=;
        b=b0Ly25QncEm4RxiLjLC1LTBsM6k4uBSYWtA55070ONWyM6tc9LhHinvXpvcCTsmwJX
         WINaNrpMbKPpt4HFiG7lnQsnTouJf8FzXTxAdmDG34tdxl4A5woQeFN1jVN1MHAx4NdU
         3Ed1FRawtiW1wISAgSwduYucG1T94eFAGgrWhLrgnA5tVHcwdn6JJ94c5VlQzeTIUeD8
         PXhGzRDjZZd7MO9D7AUlU2qkiZ9RujS/xBQa0BuRz2COypmC97lvkCpEQ0vW8pPnvVJD
         7cNYV2+rtGsepOAvKjImvcup7ml6qjU2mwqer0nOkEhPbtGoP8dxEPDPYvjLnfeelZT/
         ZsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774839140; x=1775443940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otnhQDCA/EVhv9pthT+cS4OFEczDuPC8D+Xc5fYJuM0=;
        b=UW7c0RHyGl7QpW5Kv6+4huTWUTxKa6j5RtHyqTpAcPxOIvi0uxWj+YYx6UqWJ0uK3U
         Od8shQtLuI44G8WctTpxCEv2GFwdBOLxSlBp+uWeADKNyyFirCmKW6PrZKYiRLfWEMxr
         b9Y9Py85RvDb9T7kRm3yQ0ZxkrOgbdg8Xtt2k2qtu0Hv5LaxpUJI8NcYiE3ZRwr2dgZc
         K/X0Oh1jkEZpLGfU4PnzUTAHdUrfvb2z+DkcECJejg9uVUmAVba4cSec2ughq4SxQulC
         KZoEo5NTeaB+l65a8CR/8Kr9qyyRT8VrYzQ+0z8ZDFOw0DQuEabVOyq64mt+8Kcq50WK
         ZISg==
X-Gm-Message-State: AOJu0YyCBfPEjcoXvPOqIrWO/cFuwp9lJwyp2HXXAmUohSeV2v9lD1Rr
	Wcsf7g8EdspXDc55ObiQX+k9K95r2HKnTOeKcbEfYmLbiyFn76ERmu42CNgCIji0UEmWLHotT94
	vc16LXW1nc/eAyAO/dA4vpwrB8pcflYzjTS9eQL+huCHAgSBb55hFp0PsZ/oxR7L9icCxw7m4/d
	BR
X-Gm-Gg: ATEYQzyhL9scVEKjGkYFlbB8l22oycROk3gow5hROKfzg2nLHYh1+3c6aVJQSZ4XB80
	yXMYkCOt2a8aWzdHxz+rnzqVMDK9TletaBCeN4C/6TbH+GcOGkTw/0M28N7z/ht5aoCihq2wLjL
	z3jgVNB0p/mAIX4y1qr4jLIOlQTWnO1kUwc1YCrwFZMjiU6M0Qpoy3DULWRcJ16jTrS57cvvcHT
	K7RelpbVcSmYxO8EiFd2LNmbBsmBGO1ofqmUHWSEX83Kw48CTYtCB063mBMDnL9/Z7J6GjG+g+B
	n/08Tx+xzCpFuAOkYCOhpR48Dj8B/yXlnta0xUL/Yf9QkdiuTg0e3DE7sMrZq1qxkAIAwo1Tk81
	xeiP9l/7Z7lBJDdhMSRl67ZvLRqILxh/JLTPuNxRoeYbK6WdKKRiNcUuMBMKYmKnLP7Yy7n3RrZ
	xpjJ2yYSMmpWqhoos=
X-Received: by 2002:a17:903:2f8b:b0:2b0:53b6:d0a4 with SMTP id d9443c01a7336-2b0c4863590mr125933225ad.12.1774839139565;
        Sun, 29 Mar 2026 19:52:19 -0700 (PDT)
X-Received: by 2002:a17:903:2f8b:b0:2b0:53b6:d0a4 with SMTP id d9443c01a7336-2b0c4863590mr125932515ad.12.1774839137944;
        Sun, 29 Mar 2026 19:52:17 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642864sm69624865ad.12.2026.03.29.19.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 19:52:17 -0700 (PDT)
Message-ID: <82bc146c-dc41-4d55-97c3-7819a3ec42cd@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:52:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c9e564 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yOmPoFu1Ht0vmZQZIAsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ocIdZssqpi1OpxD9wVkC3DEuqWov38Gt
X-Proofpoint-ORIG-GUID: ocIdZssqpi1OpxD9wVkC3DEuqWov38Gt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyMCBTYWx0ZWRfXyBhSZ56wbD19
 AN+HcXS49sx3/MxZc2kzZFdsgL2+qfT7WonQAtdeXT9qzsPwLrVvcTD9JxhS5a7gsguqQYU3C/w
 Vfx2nElQ+rI/r45F2houVSkRMFYkN9/FCzQ4OrMXqhI1qa1oS17/bEAlR3soUEH2HiG5L4rukjX
 +QlW7ZbvQIbfeU9ABscUfzgByzxcSGJJlMaxxW+ly/ukZ2SYO3J/swfrIdQnkrWEdD5rQIB7i+q
 FOOhhl2RqalfZNFs2RixVulrZ0ohbmt+iu10QQdacI1qeSiBhKRrik/PJ76+LU58C8WMkumODIh
 egeoAdFCi8enRQXRKVabMHo1oE40fwkcQu/L6vj9fiR9N7y7fYSKtgmHzEqsg7/CKCuIu18Zpow
 z9DSNxwoG0DvQeVTEzt2DkmS20HC9blW5jnZo2dHjV0syh78rE0k6Oeks53+tSb0Y+O+KbyEeUW
 jI/s7jzky7JnBCk7krw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300020
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100650-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5D41354EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 1:52 AM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 154 ++++++++++++++++++++++++
>   1 file changed, 154 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index ac6a6c789902..08d7c1a1d829 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -6026,6 +6026,160 @@ pdp_tx: scp-sram-section@100 {
>   				reg = <0x100 0x80>;
>   			};
>   		};
> +
> +		usb_hsphy: phy@88e3000 {
> +			compatible = "qcom,kaanapali-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> +
> +			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,kaanapali-qmp-usb3-dp-phy",
> +				     "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_USB3_CLKREF_EN>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb: usb@a600000 {
> +			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre_noc MASTER_USB3 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_USB3 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +			iommus = <&apps_smmu 0x40 0x0>;
> +
> +			phys = <&usb_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,usb2-gadget-lpm-disable;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,usb3_lpm_capable;
> +			snps,usb2-lpm-disable;
> +			snps,has-lpm-erratum;
> +			tx-fifo-resize;
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> +					};
> +				};
> +			};
> +		};

please make sure the nodes are sorted in address order.

Thanks,
Jingyi

>   	};
>   
>   	thermal-zones {


