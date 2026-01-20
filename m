Return-Path: <linux-arm-msm+bounces-89852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDCoGoqvb2lBGgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:38:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C147BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13C9B8C9E98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 15:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8679D44CAEC;
	Tue, 20 Jan 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khOALW+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjUOnQK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD043D50F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920573; cv=none; b=ljhHHsUXwNCQKfvxTL1u8McUzMSVoKHFJvukg6pjT80MSc/BiU9Rao3W/FhALSGHKbI707Vxoh0QP21JKkTKtQ8iajtPOprUfncbwNoQ148xbo7TF2/esOMAaPRhFU235iMsxvpDtmuUdC1HFXzn7uyMx1ZLkyD/XJcE/YNk+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920573; c=relaxed/simple;
	bh=cld2wmZoJ3rj/J+xhTxAwklwv2ytG7pFtjjFpgprF+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWX2SLf3ufx0AXRAV3kH6zyViAaU6ETpba7Fo5YZpWYksArgo+UfKqB965U61qi/2dtVjvJ3fCj2bHK3+Xl35sKvWBBhP2SlHSlxyGpuYCU4FxQ5HP2SekBnBUt5So+ecJzTb7dzQsOl0czAgUSFyrkzpoq78Uky75ic/8fD9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khOALW+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjUOnQK/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDkOUC3154097
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LVjRE4VxYV0zLdBnpQoBaqo4
	k87tJBm7GQsAW6vpzJo=; b=khOALW+bmfx8LK59WwyLADZYon7JsYdr2uxX9Mns
	jt9gJUfTD4WM1Xm+/YST1wZkuRNDD82fzK7xaFJLio/6A4tjrnrobr6vckTTqtCn
	MfwEAyWQDRRSBwsmQ+haNjLdXMWA1VJxF7twx6M7wdqgnfIYBk1IUPsa0a3hEFM/
	PyJWoLy7TirDtPszqrXKF0PBTB2nWM89Js5V10/xXdH5jCHeXw++ORSNU7FfTwV6
	T/eJDbqHiAXixM/vmIKrEdJZubJYx4Q89KxZyEZTSlS92BcGigeXZW66iENFRQus
	tN1ElgnqcN48ETp0LgGAkC6uCiqnKJgPWE2dn2hXjErk1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q51e34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:49:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a4c50fe5so148048885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768920570; x=1769525370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVjRE4VxYV0zLdBnpQoBaqo4k87tJBm7GQsAW6vpzJo=;
        b=GjUOnQK/T6mqXJfCMS4rqtB8/wEUPCHl0cgrqahEY9XH+OI+63y6+vsf4JEunncPVS
         1GUyUGRoSxIFGrYTqoA9EYmGzd1hQ1/A8s2817Dvh4qp+sICfTKFtDBdeRsSIcdyti3v
         rFmxZsZIlVT0WQthoLylCQSxuzzJvPxmIHY523wAqgNmdD9W/3jfgbdAL6RYRvrA20bq
         Hu+yyJZpbT5E/Mnq3vBOkmsQ8kSlsnAqOHxBvI+eAbP+yTkoShf8zGu8WNU1gqBo8leC
         7QXQ2ShqGqS0KFZ09uFrdSAJE9r3KSMXWI+paBKxsaHUcLfKyoW9ihwVuBVNxL7p7QD9
         YLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920570; x=1769525370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVjRE4VxYV0zLdBnpQoBaqo4k87tJBm7GQsAW6vpzJo=;
        b=iyR3aFX7ZMgrGkoovSa2gdVktBo7zCa+ikwAcLYQiubdyl+JGs1VsHm1w5OPr8FHBz
         RZO/DrGz1izx4ShI/u58zUjmmlMfTc+Ook7zv1kA/VvS0fz9Kh4N73j8caYN49LuDNq4
         8sbjjzYtw05uEF80/eDr8fTsu5HhSBSomBski50PAgoInXyhyulg3gcEUmMdSCtF4eTF
         PYDPHCNgV33hkFHtj6rmwxEJmVoMhmzYIx9Cz9Rj4Xcy2SOGkNHj/OfqwpxBWgqXoHht
         pvT28diXxC5lPlZWucTe8wwsAdgAkDt3gz0n3E582E9OJUn9sV5M8yetjPrU7VquQWme
         QsGg==
X-Forwarded-Encrypted: i=1; AJvYcCVLvWFxoTpiSqMYyynSTdfR3G+4bYz793Xgwurb/skeNzBuebBj6AiHMyypsQcBajFYUQ5TxkK7Znsz6I0L@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1zPWScUvZv+L9OcbrwTqBDUDMaM4rUdkk3FEYxnQB58XYIvt
	jyUFPjRB/jt5sGx4QfGMDs099Q3ro1FfOD6PEow4G50dAwm0NUZwV7Co+oPOw+s2CpwNakUmzzw
	XBXMKydvKj/XO7Skm5JxNIWhmN21EHK1omODgXhGHrdzrPLmjqxOwCQNIyFTE3hfRlySO
X-Gm-Gg: AY/fxX6ijSA1coFUXBSebpHdTswffy30xWY0BygP1mG6yDgOG102sM+V4+iMV5bgJOv
	3l9dyD2M2IqLsvg9OhEE1Di8FOXeNInJjNLaLNrQ4aZ8R+Wrzuqz+srhTICyLaDHNBGn0R1iv4G
	jUOXHt7rhl4LKOEYGh3gYJJBI6WdjvURUJU3tU/5OZFI5d2kfzBW5gZvXfqjI1fVIOu4/3/+3dA
	r10cTblE8FFFwccrwHJyrpm7XH6tPhCP7hsJIytOblJk0Q8ipNAMUi6C1N2Nj3kIMDrn3U3aou1
	zkcUtOkvBOsuIjAJqhyKFfRvBkCmZrD9MFFmd1f2LopHvEU+X661NLxkdV7ngJEt6A4RHp0vFlJ
	VFUJs3dpFhC6JQ722U1oJ2We/
X-Received: by 2002:a05:620a:17a3:b0:8b2:f182:694e with SMTP id af79cd13be357-8c6a6945228mr1898006085a.54.1768920570026;
        Tue, 20 Jan 2026 06:49:30 -0800 (PST)
X-Received: by 2002:a05:620a:17a3:b0:8b2:f182:694e with SMTP id af79cd13be357-8c6a6945228mr1898000585a.54.1768920569328;
        Tue, 20 Jan 2026 06:49:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm13235856a12.24.2026.01.20.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:49:28 -0800 (PST)
Date: Tue, 20 Jan 2026 16:49:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <zvagnaxqgrpm6bagw6zuov4oi6o4b7vmy673oh5st22tec2swl@abvblxgray2s>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMyBTYWx0ZWRfX/Vi3nH82I0fn
 Sch/8gM6GrPUN1PjCUCSQ03Yn1NetreQqB0wYr1iBfw5+Jr0z16hGIdKR5XYqLs1K2RCfKZg2bu
 Mw+H9qHdl6CuEHYbO2/3LFXgxjGVpVh8oPWxEe7T/TIjUBVUJjAVaFuMu19prTUUK5+0G7RwfvY
 OPjJezdGed5vip/eBrE9+2k6ic2WJDbps6bD2Bq6Hb8IQ1apCCyC/cqe6bUPzXEmkJHj1hYiwJd
 atLloPF3vEX/nzvL818eMpq1QO2y8w/y2ynrFPa8RIM9KA8HIXtiM44SWt5y89bd6XNw6n0wncs
 62RcMy49vyNAMk9F4MEFlbnk3CxD4ZAfjiMRvQq2ch5sFBEyonlbO1Mu9CMQOjCq9D2bch40HS5
 HsJAbsj3Cnp3hX0RKH+6ZjKBm82JQQGRMUdHU29ahOE/3L5tQbIvmmp+qUeBlmrr/bV1sR/oTjo
 uPWlIi8cY26FrjZIkpQ==
X-Proofpoint-GUID: tpOXAj9udTGbtRNTpv7aFRHM0mLCGGjI
X-Proofpoint-ORIG-GUID: tpOXAj9udTGbtRNTpv7aFRHM0mLCGGjI
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696f95fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=0k69HSTtqGF5rPJBr-4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200123
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89852-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim,fairphone.com:email,1d84000:email,1d80000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.25.240.160:email];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB4C147BF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-01-12 14:53:18, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 129 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..7c8a84bfaee1 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1151,6 +1151,129 @@ aggre2_noc: interconnect@1700000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,milos-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_UFS_CLKREF_EN>;
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_hc: ufshc@1d84000 {
> +			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,

Maybe I'm looking at the wrong documentation, but it doesn't seem to exist
such clock on Milos. It does exist on SM8650 though. So maybe the TCSR CC
driver is not really that much compatible between these two platforms.

I take it that the UFS works. Maybe because the actual TCSR UFS clkref
is left enabled at boot?

