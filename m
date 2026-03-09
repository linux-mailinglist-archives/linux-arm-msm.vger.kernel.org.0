Return-Path: <linux-arm-msm+bounces-96113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMA9FyBlrmlbCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:13:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B741E234209
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 941E73004601
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144E934F257;
	Mon,  9 Mar 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g39Y4S4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZkOL5D7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056134F261
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773036804; cv=none; b=JvF9JTQZoxp+hxfuy7wBZb0pGAgwRrjjfcyvt9kJ6sZCF1QYjukj+XAuIaAxuraZBoSEVgUUSlqTEvPG4YpwnG4ZfJytJDdAz/Us2ZQdUpADZAvD1+nvoObqzQ/pxk/3TrLLpaX2/NYDwzFc69S2lxxcBKZATvIjfQAiMIWP+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773036804; c=relaxed/simple;
	bh=QfATcAUjE3rhjZR5QDPsSsODlqDLTMYLT6jGeFJo8N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M809zaQ4iEYfRxFEyC6ouezl2KHf7NB4DkcsqXepPdx/uqv38rBl4pi5EkDPb4CmgeFGgV1N9ysasCN+nOuJyVsijtDKohjQ4gUUww9DoCBnEi+0c0Rb4Pm15xQRjoqX57RvotpYe6o9I76l18APoz4cUXyjEHnyA0JFYV7IsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g39Y4S4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZkOL5D7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294fW9o1589091
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uik8PKSTrs9X48gkBNE0kt0a
	/VsJjkEh2LT70pMKrCY=; b=g39Y4S4kiB2QQ08sitLp+PcDwK/z3WoVUTym+W6B
	kkbeDD7J1JOauEVnEI758UoGIlZlTl1C8J8kwVIf4eZHjaNF0d8YuK4Jwgdpdk4A
	1U1VH1qHaIE7Vsji22xA+/EdAX6eLoP/q88TkDiMDdHOqhmEDUtwhZxLDdE+yaQL
	af/mcno/I8mJAqw5qKdMhGe8mxn9JLd80ysX+ueaCKuu9jjYs/Jkjp7TuzdTO2eV
	/gUbBkt5NRjcvEZ29ZsUjT2qWIWUfo2uY9jUsTtusU3V3I1uiJ7MDFGvIi9YPsWh
	jLRrOxgnHGmpsTnngQSQi27TYvAvO9Z/WUuE9Kc2A16BHg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy87bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:13:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so10489000eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773036801; x=1773641601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uik8PKSTrs9X48gkBNE0kt0a/VsJjkEh2LT70pMKrCY=;
        b=hZkOL5D7OLk55nNhHAYZ06tZ+FjR/4vHe8gPwzVuQYrR6A/NLd4sUIYnNX1mXKhBkT
         AK4PWQSDmXU9RXh2rhpcy9aHs6Ytd234bP4S/kUBLCqJxOPbKDfIFDiwvtnw4oS0gatT
         WU+u2TilEvZ2n3H0nUeMoBR/TIhOcJjjoC6h6CU99MpFJuhkgA6pKIHMd2vBUxVR3ULo
         IAW1zskIH9VAM/tosFJhnYJEFWml/NmOnD/UhrvUACDYVFt8sYMT7IOq62K+4XWTbyco
         QwDI37fU4dFchIXELHQWcOHanMhLNyePef0XlAfbAmJQQQGz5qJ28KusIa4SyNrQ0dv2
         PlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773036801; x=1773641601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uik8PKSTrs9X48gkBNE0kt0a/VsJjkEh2LT70pMKrCY=;
        b=V0qxZlDkwSCSD/4n0sIkcvTfXBzOuw4F7ocDv7g7bafq1eTHmCvD6aknOiuojWmRSE
         IjuNDB8qKYoLJ8EVm2gQlmaPFZ4K29mM6LqjIcpmnAiuat3hoyWclegKvAj5b2u+iODD
         Z07pc+MqZ0u3Zd1akgkvkQd8n4WKW9VjDq5MOJXutTPTuQwByzzYkEn4eDlxP/WiMMTV
         Rwhf7r8zPezWjUXuCl6DO0WIbUNqpgYvzql45L4B5rcGDENoIOppXBDIlSvHYIE1XseQ
         m5b+nIwKQRJIvdqkVWnAQpSjpsj90eSCiQ9cx4lhHUDLNfzpuJQt5hGjm2EsN1EWMj1d
         bjQw==
X-Forwarded-Encrypted: i=1; AJvYcCWr9YG4YaOB5ywRNORzA9LnqZBtQpYTBvNpKWnhBfRLxYfksH/m+ZvtryR5yB2sWevHcBMM9KhLOL2R8dLV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XO7H86pVQwN3RGQX4GT6UDfSWMRFasjFmqTUEPoJjk8dy7Qz
	+y50m6yGZAjxXwkXehtUjsaZYPkdsj9hXwSFfJnqZD/QFtl2GTwF2ovEEysqz9GIUWRBJWF3jUk
	yLJ6bagxAML9S1W/j8JPY8VBHekXN6Yj1NVjAhlf4gEatgOYTmCiJ84wsprZxDpH48wi7
X-Gm-Gg: ATEYQzyd3Tpu8vpKL9rHgGwxMSHX6/p9PJT6SAfBoliZbkFbNMCWXx5uCy2O467SHsJ
	ZnWJItFqhv3Oy50/yFY7xKQ2J9QQN9czPoSbv9Jeu8CtYRJWJmNzFuHZ0/641YMuLoJHGbCA5Gk
	s2hso3Q4bamE6Y5LoMOUeV0f6tFX9w5n8Sx7bJOjMCBZx5yr9XM8SHeRhm2DFB855rcO3QAyz2R
	LhV+snGgpGBmxLTStVL6GCyWNe/+kh5Xk7Ha7WaAyhWj+l5/RMv2X5Gkc6VuS2EZ48Kp+JG3+Mi
	aHGeOgD4uXmM+L9S3iCFN0YacAWtKLtIljjjDMfEvxnnyHIQTRDErBo2UGbLVKVXOXM3ZgRZnJV
	OA6RHgCW0HVBM00dbaoJLO3hgsjk63VBTk+InQumbhIVl3KD7VYi431EJaYhAjEx8DAGk
X-Received: by 2002:a05:693c:60d3:b0:2be:142f:d481 with SMTP id 5a478bee46e88-2be4e03ea2bmr2842699eec.32.1773036800964;
        Sun, 08 Mar 2026 23:13:20 -0700 (PDT)
X-Received: by 2002:a05:693c:60d3:b0:2be:142f:d481 with SMTP id 5a478bee46e88-2be4e03ea2bmr2842682eec.32.1773036800377;
        Sun, 08 Mar 2026 23:13:20 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f8078c6sm9451943eec.5.2026.03.08.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:13:20 -0700 (PDT)
Date: Sun, 8 Mar 2026 23:13:18 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane
 bifurcation support for Glymur
Message-ID: <aa5k/tBs3vGXE0uY@hu-qianyu-lv.qualcomm.com>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <42a9dd4d-eb96-42c0-b836-dcd7cb9405ff@oss.qualcomm.com>
 <aaqdv7Zx5AODzg6P@hu-qianyu-lv.qualcomm.com>
 <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1NSBTYWx0ZWRfX9EsbRt00pYKV
 02tIgjIZI42pPysxrFEw4BaSyUl7AXN/8c1nVLdwIqPzkST0ZEcaHuZVXLc/uAdEhHQE7eTOR3F
 DPDuoJUOM8vMDShEZMw/5Hkm4nUxqBmJn9b/xBFO2WdK2N/3QJZnKzm5ZFxtbCm28BqtMTQ8IJX
 6dHrx36SSF3auds5llqGQwmY1Xsicw48LsadGKVY+oemOzig+e/2kCHuCWZAuwE8JdYabVVzopm
 9xd9Qd8CoaIlBc5eplXBRLu/J6AOjb3OWXbAcZTNqsGHHRWD4AR6vUQuOZ5qFx9OHueXdYEPzB5
 vr7kyY5wJfpCTIzLWaws1hZgO54yWiw/tnaxhUFvxA5PjwIUBa5C/qMqSRsSZgTSbWQPzDRxkCj
 tklB4k/c2u3ZQoxWeg2YjQXdDZJgOkovU3MtLVcCYnoZnzfeyxRkwk97DcJdkEvgYWMarLN4czW
 nmci9EUwqqUsx9u69OQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69ae6501 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=O2xUQfZD2m46tlq_ZQMA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: eihz0abwvtQHY83hZm6BUt4hzJyYdhpX
X-Proofpoint-GUID: eihz0abwvtQHY83hZm6BUt4hzJyYdhpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090055
X-Rspamd-Queue-Id: B741E234209
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96113-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:34:37AM +0100, Neil Armstrong wrote:
> On 3/6/26 10:26, Qiang Yu wrote:
> > On Thu, Mar 05, 2026 at 10:14:05AM +0100, Konrad Dybcio wrote:
> > > On 3/4/26 9:21 AM, Qiang Yu wrote:
> > > > This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
> > > > the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
> > > > acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
> > > > Gen5 interface.
> > > > 
> > > > To support 8-lanes mode, this patch series add multiple power domain and
> > > > multi nocsr reset infrastructure as the hardware programming guide
> > > > specifies a strict initialization sequence for bifurcation mode that
> > > > requires coordinated multi-PHY resource management:
> > > > 
> > > > 1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
> > > > 2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
> > > > 3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (bifur_aux)
> > > > 4. Poll for PHY ready status
> > > 
> > > I think we never concluded the discussion where I suggested the
> > > bifurcated PHY may be better expressed as a single node with
> > > #phy-cells = <1>, removing the need for duplicated resource references
> 
> DT requires strict hardware description, no abstraction for HW, so if there's
> 2 PHYs, then add 2 separate phys and reference them from the PCie controller.
> 
> On platforms where you want 2x4, then add 2 pcie_ports using 2 phys, on platforms
> with 1x8 a single pcie_port with 2 phys.

For 1x8 mode, we can't add a single pcie_port with 2 phys. I have to treat
3a_phy and 3b_phy as a single device because of HPG init sequence
requirement:

1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock.
4. Poll for PHY ready status

For X1E80100 PCIe6a, we also added a single phy node for 1x4 mode.

- Qiang Yu
> 
> Neil
> 
> > > 
> > I understand your suggestion would look like below. I agree that the
> > unified PHY approach being more elegant from a device tree perspective,
> > provide better DT flexibility and eliminate the need for different
> > compatibles and dupicated resources between 1x8 and 2x4 modes.
> > 
> > However, this will include implementation complexity to phy driver.
> > The driver would need conditional logic to selectively enable different
> > clocks/resets based on the PHY parameter and maintain mode-specific
> > resource arrays. There's also the issue that assigned-clocks
> > GCC_PCIE_3A_PHY_RCHNG_CLK and GCC_PCIE_3B_PHY_RCHNG_CLK will be set before
> > probe no matter which mode is used, even though in 1x8 mode or only one of
> > them is actually needed. For pipe clock outputs, only pcie3a_pipe_clk would
> > be needed in 1x8 mode while pcie3b_pipe_clk would be unused. For
> > powerdomain, we also need to add additional logic to attach and turn
> > on/off them.
> > 
> > While these challenges could be resolved, I'm not sure the benefits
> > justify the added complexity.
> > 
> > pcie3_unified_phy {
> >      compatible = "qcom,glymur-qmp-gen5-pcie-phy";
> >      reg = <0 0x00f00000 0 0x10000>, <0 0x00f10000 0 0x10000>;  /* Both PHY ranges */
> > 
> >      clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
> >               <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
> >               <&tcsr TCSR_PCIE_3_CLKREF_EN>,
> >               <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> >               <&gcc GCC_PCIE_3A_PIPE_CLK>,
> >               <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
> >               <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
> >               <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
> >               <&gcc GCC_PCIE_3B_PIPE_CLK>,
> >               <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
> > 
> >      power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
> >                      <&gcc GCC_PCIE_3B_PHY_GDSC>;
> > 
> >      resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
> >               <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
> >               <&gcc GCC_PCIE_3B_PHY_BCR>,
> >               <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
> > 
> > 	#clock-cells = <1>;
> >      clock-output-names = "pcie3a_pipe_clk", "pcie3b_pipe_clk";
> >      assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> >                        <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
> >      assigned-clock-rates = <100000000>, <100000000>;
> > 
> >      #phy-cells = <1>;  /* Parameter: 0=PHY_A, 1=PHY_B, 2=UNIFIED_8LANE */
> > };
> > 
> > For 2x4 mode (independent 4-lane PHYs):
> > &pcie3a {
> >      phys = <&pcie3_unified_phy PHY_A>;  /* PHY A only */
> >      status = "okay";
> > };
> > 
> > &pcie3b {
> >      phys = <&pcie3_unified_phy PHY_B>;  /* PHY B only */
> >      status = "okay";
> > };
> > 
> > For 1x8 mode (unified 8-lane PHY):
> > 
> > &pcie3a {
> >      phys = <&pcie3_unified_phy PHY_AB>;
> >      num-lanes = <8>;
> >      status = "okay";
> > };
> > 
> > &pcie3b {
> >      status = "disabled";
> > };
> > 
> > - Qiang Yu
> 

