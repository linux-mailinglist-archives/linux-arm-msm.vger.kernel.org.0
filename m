Return-Path: <linux-arm-msm+bounces-99365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ht3LP2FwWkSTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:27:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DA2FB460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A8A1302796C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8362C3BB9F0;
	Mon, 23 Mar 2026 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/tYsbjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nutf1J8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E127E05E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285965; cv=none; b=Ymnw5GJ+PTMQGzOYpv3vqHO9yGmw17b3XsONCERHaFhurH/o+7nNNzOEcLcFlBbQ+uYoz9sx52uNQaUagmET9hrJdufsbH/WMZxIzRq0BGXQb6OZGLeoFF4D9mb4I3Z47fBPIYAo+a5OVgnmz4tcHAEyuIY2MBi8j5lTTYqaW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285965; c=relaxed/simple;
	bh=VIH5oseomoaz2aNTCXssIM5XnulyweBpmgXeIPoAh6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDodB1GO+LGL4fe9jGuiiZumj5Vhzev/c6l3UjC892R3azzaFSXowxL1bGzRcyjBRCAOS2lXCtSm3xY8ZFF9y4AyBumqJ9NNm67fjMS5SmH+LggSAk/4EgZ7If7SuudywKsz13xnBWsybypAMXzXasJTFNOJf+JOfwGo5U+7Xv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/tYsbjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nutf1J8r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGipO3589370
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3ROQRlFPBoLrDcR2n19Hmz53ktfTwjjW0C8cQSfgLo=; b=a/tYsbjrm7lFDkNj
	/fPpmhymZ4JWDkFqdE0Sl47BjKgdYqllgV1l1y0uM7msbJ0SzBhjj0ffeccpf7J0
	PqjDLAkiLs7jwO0534ZLrWWwuuEthvdhLmu9BsdPuEz9y31OrO3coGaeu+/hqMg+
	xbCuJTnLG0PBkh/7lPvJ+gh0LnFT2ylS7w5B1RSxI2SUHNNRH8ile402ItcdA/UR
	QPMKBcA8+ct0ngO3b19DNdfL9MH81Ejv8r87ArGPWD7XDJL+2KNRW9OcVyRAXaQd
	Bdk4dEzy2GXnvc8dltBZRtPba+Mr9tmyfr7xybZ+Ze3bcL2ZwxP/as5mKnlc8P5S
	1mhH6Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0gk3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:12:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b94e2caf9so16166478a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774285962; x=1774890762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D3ROQRlFPBoLrDcR2n19Hmz53ktfTwjjW0C8cQSfgLo=;
        b=Nutf1J8r3aqU64uiPjZrMxttn2E/YgUYsAdJmu8U6FkaIKkDs9FJZqTWq2/OYbILgp
         e2oqdzMsEMpDaBP3/n5Mi5FOhtkNU/blX5bIqU1tYcDsuilf7PXnE176ReuDPBDbZXCs
         QkMEXJ+czjo4z7t9YpllusiXt45PuvJm6ggFgG1tkt8gyvv0iRLfTJnU7GrIVLYayhW8
         sMY3g4+a2JozcQ5ywWa/BSZDInplmgclK9PvbEnpEI/n1dwHlLNPJWfgsD/9bZav23zm
         MXy72Jt4ZWF8T6OHfjVV3YqZeQ8R+Oqb5OfbYMrUsZoSfT6rTuKs3WkGpEriBlXCJlrg
         szlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285962; x=1774890762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3ROQRlFPBoLrDcR2n19Hmz53ktfTwjjW0C8cQSfgLo=;
        b=LIDMajuJbqwThmv5/YIRvJf7HyRjyQbCVajwb08Xx3cieWH9Plpi16hB/NR44T+2nM
         6t4JE0rdX4CosuvcAqvgDOseERAEB1C9LdBcA9i/lMZrp5tI2kXBiB4EXgvRwJNgEXIy
         8RBYlFHyAMpwS0oHCaOVbcd/sYLSGlj9iyyGK2waRC1pE7E5BmAeYCqEhXAXb1DFAfEu
         5kKPh01j7rioLLJsbJE4NWvBdzsHGZzxEUVfmYCH5/gGZPAkMHFtum8/LJECkVlO+qzo
         CxyLyvSkMPqqlp8UzDNqH4DKurHXIGkOodbOyl5untZMg6KpCDHGWFTzbGHnVmLY/0Wd
         Byag==
X-Gm-Message-State: AOJu0YwzxnkkSKIgTXY/MBRWZSQ1Bir2PedGINZZAwlxlAhFkJrP7pVF
	7Wq3tpp5RuS7A0PHY4ztiviq9j+eix501xFm0WOPqX+O48ZfSVmPi1nP+mQd0Xi3Mt+9NZ6/Fki
	1k2A01BB84Cy74/wJmKhORcawS0kJLUQWgSqSeul+fh/kO4OneqCHsiIYKGmXGVJalyfOMcvO0Y
	Yn
X-Gm-Gg: ATEYQzx35Gd4dG1yI4mWbfm/zNt3i7cFlGmqHrD51O3xFEQmiHW8j5Q0y6vi8wqCe0H
	AB8vux++QU2ge1t+dPfjUe460A8u/F1s4dCaFr8L/AHuBQ5f96rtdKZfCd18gxkWd1LRsg57bdy
	7N5Ibqn7TyEhHHSLlP+mg2rkCPIznUrinj87kkydN6ts5pviuZMjnx6CSIpnpb49MLdwZsZT08l
	Z9v7dWrxPTCkHB2yW/Fpbn7w9MqE6lWzip3xt6A5kxIuDzvQuEXdsOo0Llcgf5sHvn4BhcTFPkU
	Dpg8ViDCY8ro2hxj3mm/9P9k3coqYX6nUHw4QnmGFeS+1dAhhfjwyV4wKBIFRqC2odgVwEDqRuX
	/JWhgjuFTQ4GxD9B/POreClxB4kCxBmUhoz5f7M3joy8REErw0ChbCmC8uoo=
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr10918233a91.4.1774285962495;
        Mon, 23 Mar 2026 10:12:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr10918187a91.4.1774285961848;
        Mon, 23 Mar 2026 10:12:41 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3d8c462sm10077241a91.0.2026.03.23.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:12:41 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:42:34 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
Message-ID: <acF0ggIIJFb7mUUR@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1748b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i-sMpDq2_rzAXM5hadQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNyBTYWx0ZWRfX/8jRvMay07jF
 xYP6G90OIZ/MDC/so0BU52HIlkTVRwWKPB0gwDhbTnyuH1Ix1eANEDk7kpGVJeL8WGo/yR2Cofc
 aewpqpc3HLgI6h3Vf4UXdBfU2jQ0fAtKPWAJbHORrdrui8ebJa/D/sjcKg7+HIFyJD6/gsoKZRu
 MkjEIfLuYB+g3Q0Ljq8zqK7F1/obsuO4sWMEZauIvr1Vl0WDQZyACnl3+/iL/Osr1V8f6uan7gH
 x58vj5sQxjgB4+0q7ICL3qJ7pyzccHutlUlE6wKZnTzecAQFxYpEF72DTbq9X6HLqCil0RBXVyQ
 1nUgWf79mh388lt6VHkC0lt+WjUBRI4I/iVgSrHPQfT/aXomgrfkz7/XM5jSMZ6gBFWXd9nErGJ
 DoD2N4K5BO0gQTo6C18++EBhYJKwrLw+SZ9pzqrefwqq4kTxq+gV+n29k8Of0LBp1N2K3W1F7zs
 BzwHVT1gpeE2cz6WxoA==
X-Proofpoint-GUID: B2UJNK9hzMPVX9Qy0o_zf5pfSdlVl2UM
X-Proofpoint-ORIG-GUID: B2UJNK9hzMPVX9Qy0o_zf5pfSdlVl2UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230127
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99365-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-arakshit-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 534DA2FB460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 04:19:15PM +0530, Abhinaba Rakshit wrote:
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during probe to
> align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> 
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 7976a18d9a4cda1ad6b62b66ce011e244d0f6856..e8ee02a709574afa4ebb8e4395a8d899bf1d4976 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -659,6 +659,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");
>  	}
>  
> +	if (engine->has_opp) {
> +		/* Vote for maximum clock rate for maximum performance */
> +		err = dev_pm_opp_set_rate(dev, INT_MAX);
> +		if (err)
> +			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
> +	}
> +
>  	engine->core_clk_freq = clk_get_rate(engine->core_clk);
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);

Hi Konrad

Since you previously reviewed this change, I wanted to share an improved approach
that I recently realized for handling ICE clock scaling in the MMC use‑case.

So far, we have been voting for the maximum frequency during the ICE device probe
to align with MMC requirements.
But because the ICE probe is common across different storage clients, applying
the MAX vote at probe time may unintentionally impact other storage paths.

Now that we have a generic scaling API exposed, we can make this logic
MMC‑specific instead. In particular, within sdhci_msm_ice_init().
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mmc/host/sdhci-msm.c#n1966,
we can invoke: qcom_ice_scale_clk(ice, INT_MAX, false);

This ensures the MAX clock vote is applied only in the MMC context,
without altering behavior for other storage clients relying on the ICE driver.

I believe this results in a cleaner and correctly scoped design.
Let me know your thoughts.

Abhinaba Rakshit

