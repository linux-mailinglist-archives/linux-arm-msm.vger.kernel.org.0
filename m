Return-Path: <linux-arm-msm+bounces-101346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBEVFAUczWnOaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:22:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EE37B23E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88A2530125DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 12:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F5440B6D7;
	Wed,  1 Apr 2026 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+ibQK9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcfJd9OA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4AE40B6D8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047332; cv=none; b=Qdd2IcsWgRlNy8o6E48r50CC2yzCIb4qu+9RWQvnmLx3A5IhXQiTqjsW+8+Ks//Ab6h5etrN7Qaq8UaqnIaXYuCKZuP4xwKSe+wqeN0qDOODedbJZBuQlUQZJgmEaeuR11Op/LogGjypnLQnhRTxUUFMZ5ekwlYBST3B7a6VHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047332; c=relaxed/simple;
	bh=srxYEWpFQOomq2Hn2s33wqSQN7ZO/LNMd0UuJ0YeX0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq1xEwHZ/G7+Rs7l8OybiwbqY9GJNJGKCDY/dIyFit6ceCngNUeHAgldl7ncDiTVDJrgNqqip+5FUieW73CZ6dmBrjEcKaXBhunK5FYXwuakwRzYUslA/SjFcrf5tMaq6ZYGF9SRNP2djU1l7Df05eLpDnswFP/k4Q8kjOB1tkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+ibQK9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcfJd9OA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C6p5H1285829
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 12:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLw4r0OJasPaNxlmt5P5wWJCAn87qbKh4XmyalsNqRg=; b=o+ibQK9QI2m8ExpK
	6XZ4iVelITy5tHwqylQyv2Bm9iZk2huZ1Mnfl5c4Xh8Zft1OMfRO+Kh75WIYegz3
	VogdinegegkWMAzyU+2WgdCSde2PMYAr1h5B5WyAXnce4DWsYXbEWxJpKkkhqwB1
	IGpvKMxU0zOQQuboye/8M9Rhjn7o/glxK1EQbsH9tfr3aQE0DhLm9Q+5QCtK+5zH
	wtmRBpPWrwqrnt135gpaSDD+jvue3zXRR9Ekg7ZDD46r+GxeNrSoHGvg2Xmx8GOd
	lccggtGB+KQynygOEEEoCEzDd3hhL2GjLNP4p8UBKeg6pE2zkEAYKm1iaiWY7+IN
	WkMqfQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3saw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 12:42:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c6929bd26so10992061b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047326; x=1775652126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLw4r0OJasPaNxlmt5P5wWJCAn87qbKh4XmyalsNqRg=;
        b=NcfJd9OA+q5KgrNUQB+aNRnqWubpHq4w3QEvxHSYjaHg+QRCtfeMzt/5uDbf+Ii2ZT
         8dAPFOfviceZTWAeiKUteItFRVCLEf5W+B73o4EK+aaZ2HCl5rnVD0R1cvEqHN5cl9Al
         RMiUPpqhgA8PP/0vcZCgfUgO/Z9Hxh7o6Gr6/iA94x9vPm91Z4vAe1KOZRfyNq7fz2JZ
         NWgpqt6aEa9skEd8XR4nd1139mm9qppXL0QIjzF5tuwCdSCLp22q6frAqm/J34stQNCt
         MaPyTxqBlyKqI7KqtKgQmtqK/mno6CYA9VMIBqSroRIut93VSdZ4BEUGfX7PRh8CWEP5
         /bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047326; x=1775652126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLw4r0OJasPaNxlmt5P5wWJCAn87qbKh4XmyalsNqRg=;
        b=rRloGys7rSUEJZmj1I/2JRZ9KfbWwsQC8Cb3RDcOMty105+E/2X/n6QuDksU7uy1q4
         REV1VnyFRz4PsxJ3deTkeQDmOYQklzWVuUD24rbNE+j0uzqKir64cZCtjvi3TNbveVIw
         92reUgPeMYoKgSoUtkFCACq3gNpoKBXLV795kuf0iiZ4v5KNloYkUJ59g37Dmv0BYb5j
         0MHjw/uo/APDgzXQsopHHSOqg+rHcE+HXBhEPOYExee+5m+ZJ6lWbFhCs89Ks81LZ+k4
         PNz0OhIGCKRASzIiqNsBWUmmVRts2YSKbPIjyBXDd1Y8a+mneCxoQXC2MwhXGgirFRV3
         uzLw==
X-Forwarded-Encrypted: i=1; AJvYcCVyT0lR325df6ZKxDzxVzjdqoJv3OKSdQbRL8fsLlGyPTflKAoRJXbsbq07CGtaqEk+EGNfG4yRz8uGuVCT@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPm6NcfvfyaOCs41+eMs2AScbNLFvTcITi7OIMZcR7+FYmqa3
	CgOLWiFyBZseWAp7hgvgBymj7h0JCW3AI63gvow+LaWf/43zYEpdLZRcTD43uspCYOlyQms01ww
	j4O4qQGLiT95vm055nUsD5BxgXDZ1cPBEkr79YI7aNM+7jD/ejcYPawmpTZlGII9kOvWR
X-Gm-Gg: ATEYQzySLDa0x29x/+knB+FxB6EoFmcY4EGdysrlR5Om0zAdcE3hFTLPLKGchrunH01
	pKedbmV4wTER9g6zScg42wvASGXGIKz+h/oEgR4T6V/4UTqJrYFqhWdEKletZ5erxgGaP9WQ/5D
	e/WN3lo9ePV+hInSF7D9U+kBnQpOAdd6uNDYLMzbagmBldjkgtVLbZ+5Xk/fbk7mPaSReebCKv4
	npPrCSB9ol121r7dfEkFw6Alll3clrInwTpwvIIbWbCxOyofW2K85Llk+w3mJsPxirTQOfM17lj
	RVC3vTi8vwMJNOxMXfho2YokWC+Bde22O+oE+5k5w6AJW+72T0wFeD5zAP3uMsdZ4AEAkAKdpkj
	+Cw+3OsugMdKnOTgBK3SNyf5OyQHNt+p/FZeRYNeucUsKNoXxi2P07g==
X-Received: by 2002:a05:6a00:12c4:b0:82c:e4b9:531c with SMTP id d2e1a72fcca58-82ce88f5976mr3521935b3a.7.1775047325833;
        Wed, 01 Apr 2026 05:42:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c4:b0:82c:e4b9:531c with SMTP id d2e1a72fcca58-82ce88f5976mr3521896b3a.7.1775047325191;
        Wed, 01 Apr 2026 05:42:05 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cde86d73bsm4773450b3a.57.2026.04.01.05.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:42:04 -0700 (PDT)
Message-ID: <849b412b-fd92-d3fd-83bb-f6bbbaed7d12@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:11:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd129e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-AVdbO5R1FNXJZyXHBMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 2ljjivjq5Pba992VpWLow1omuPqDy7So
X-Proofpoint-GUID: 2ljjivjq5Pba992VpWLow1omuPqDy7So
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfX0l20DqCRhMFf
 WjHsTqdloNAwFfXT3hJP2G4KBVvIKz2e3b3FTEfHtz7EQKUHnrGzu7IjNFoHmXPnhB9etc6F9hi
 lVMWuhRoY3c545LT74yMwoF6SDLJs5mA4aghO9zyImB8LBHLe5K0PJ+xDIOM6yf/aXN8m/nXJlQ
 Je0liqr4t8kbd3s9XamSO4QMnMGBbRO9Ureuz9WK/XQjNEq9mYiJB5JG9ViJi2XzU/I4UFz/N49
 ze4xcOTUHrVQtQ5yz4TztQlC/TLpKUGm4+QqcVpZSPrQGZXyRLicPBvGaGgf6RLyvfwcpnC4++W
 5z/rC5561gYJUc98iZK6gn/52SyN3F9velz6D1nWoWXoAnKY5AulrTtg/3UolTMBhelP3YJqDhf
 H/8ktuwtURKP7tj/iV/V070GeRPoZfbj3hnVbp3ADZvJUUC7gBEpGBuUfhqpXbwGECRldvlB24g
 glhDFc3rLBqQARcRi3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-101346-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A8EE37B23E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
> index 70e37fa91f5db83e66f9706b62637f6e18dffa89..c2f4457b83e193cff20120c50b53bf4c67e57239 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -21,6 +21,7 @@
>  /delete-node/ &cpu_pd11;
>  /delete-node/ &gpu_opp_table;
>  /delete-node/ &gpu_speed_bin;
> +/delete-node/ &iris_opp_table;
>  /delete-node/ &pcie3_phy;
>  /delete-node/ &thermal_aoss3;
>  /delete-node/ &thermal_cpu2_0_btm;
> @@ -167,6 +168,55 @@ &gpucc {
>  	compatible = "qcom,x1p42100-gpucc";
>  };
>  
> +&iris {
> +	compatible = "qcom,x1p42100-iris";
> +
> +	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
> +	clock-names = "iface",
> +		      "core",
> +		      "vcodec0_core",
> +		      "vcodec0_bse";
> +
> +	operating-points-v2 = <&iris_opp_table_x1p42100>;
> +
> +	iris_opp_table_x1p42100: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-210000000 {
> +			opp-hz = /bits/ 64 <210000000 105000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000 150000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-335000000 {
> +			opp-hz = /bits/ 64 <335000000 167500000>;
> +			required-opps = <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-424000000 {
> +			opp-hz = /bits/ 64 <424000000 212000000>;
> +			required-opps = <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_nom>;
> +		};
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000 250000000>;
> +			required-opps = <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_turbo>;
> +		};
> +	};
> +};
> +
>  /* PCIe3 has half the lanes compared to X1E80100 */
>  &pcie3 {
>  	num-lanes = <4>;
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

