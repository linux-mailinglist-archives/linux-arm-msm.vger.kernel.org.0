Return-Path: <linux-arm-msm+bounces-62778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E11AEB7C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34CB4A7DDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BC22D3EE3;
	Fri, 27 Jun 2025 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhKdUWbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B682BF017
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027631; cv=none; b=cLE32bywMoRGVj97sjC6J8alJK6wij3tYrlY2HDCHKypKzO2Tlbk5zFR2J6RQj9c3lH0IMLBvN1JXs6Y0S09MbPmMPHVHMzQhdJf9XvCCB2ESbs8QtUuFfkNgRO8lLMXXlXHlmPYwrqP98G9WEWSMfl0caI555J8j0E21Lnbp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027631; c=relaxed/simple;
	bh=7+B0fupMsVNOVu8V8tGzBY7GBfas+EnrrN008V14AM8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHcw5c/SrNFJGLjwusU7GxT5r+Hw9qCvmYiBwSA4HeqX6KfLcXcJY2CZVvTj9ogZvJhv94e+gB4p2QL3Eyf3Pc+OcPWiYImZ4iGPNBKbCrwiClB/0cGZfNjWrO47owNPc7/8mjqFCNAwwna4oxLGEPw2CKlca7tutaFM/omn+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhKdUWbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBw7qL029900
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTEkigVB7s/c3lzv/enIwb+8
	61vMMZEHP1ib8VKxubY=; b=FhKdUWbQs0wDrTxBmzOXj6S6VP0KvFZMwrhHfpPF
	Dpj7mDpdrU2upICSoe0D//KYXr9adTPEwMsqVXZeVlyMrYlz2QUlu0yptXMo0F2k
	jnYwYKuOlVbnoxnMq4AIX4O+YqejlbBS/7MrhJWNQBg9SXnNv8zhP+Zsrp58bHUw
	H4xTIdZL6p/3QhS+M87CECCOe7ILf0jaZCph7RYTz3lMNEVWvqfi3ytdFCWyAhhs
	iiomT7YFMPvCDhX9gcgLfHasF9s3iuGN+Dzv2BxBVpU4OcQ0OuN14YtGfRVC+be+
	wSMANiWjYSOW1DLLUQ8VP05FOh1okYUnCjjNCC1FCpwpnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbhg8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:33:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38c5c3130so313588685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027628; x=1751632428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTEkigVB7s/c3lzv/enIwb+861vMMZEHP1ib8VKxubY=;
        b=NqjLbetDH/Cp5Q1nRQ3vAI6gzNL3xbgFF0p6a9I4QDaw4D9xVQHK7idrRK+NLGITo9
         QPkO7zyXMSizI6sZTLEnLvwpv2zRfoYt6+hT1qli3HP9Hah+jtvf5rUXoi9qsQDPwwn0
         iBcwEFvB6j5gf6cjLEt0GxQ8w74m0yEqf3XuUgUH0VVeiGbQ6MNJ0eEYGkjX1NuOqJxj
         s40rmRphwyHfflYdLA/d5fVfbxlO1HMRfHVxQiivLVs0WsW6d+B2aarqRxrpMoJymWzx
         c7oc+J+fgYap/FiRtHcaDF69OBDFPzrMQ670UtWjtlgvaZfJx0sBP0S78fUDq9knbBaR
         o7sA==
X-Forwarded-Encrypted: i=1; AJvYcCW7HOi51rjyu5OHSd8kDzrMvi4WwAFgtrpCt1vz86x6QPC8yR7P+dpRVH/9jr9LajqSJaDWpOJWq7i0/cf2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/BsWmd1cul/2Muy0r6DWx3z+VbYuM9fteXWVzLYMOXRUNiyX
	1E1yVwJIq4Le5ey6zA0a6aVBnIJriwQr2av4xcD9GZACqwgTQOFfSG1mrUNjZmFzreEwqvLfa/8
	Cy+NeTd68xLp0byQXSiGDsWoAksukh8xeFZ4/q7EpEhApoWOu++R1ACL6Gc2n4duy5Y0C
X-Gm-Gg: ASbGncuY9tPnottSgpQiSduvYusEwIo6xfZAdQBsxBu/XgOdvKjbcGdmhP6Qv0y9kDb
	IAhkXXEgtqGN9k610yLiPaORtfZxAl3Y9XVEqZTwTy/5FiG4QnIdP1dPwvUSi7nDQwJ2IcpLJDy
	D3F0MnebX8BVZmL4Pe/cDFOTfsnnRmUKXSt93e2PtjIXU5P/duhx2e9A8uhn9PpQKMGmJaAkmiS
	Gz74y/92uvsO3maxfpwMXThUJTpohF66485HtrbFhR8fg8WB1alIuXNhhc28tucOZK7nmJvW6P1
	Luwq+SK+XiIAf/SKbu65rAEKHFXd4rL3vJY/cNCGvwSeS2H3PHVk3YeJIA==
X-Received: by 2002:a05:620a:278c:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d4439a80a6mr450478185a.41.1751027627763;
        Fri, 27 Jun 2025 05:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Cgx2agTOK5/IZXOIF0ZSAwg41hRwabLP1fIcfmij7RmRnTOdnah43vsFXkHU0/3rV84TIA==
X-Received: by 2002:a05:620a:278c:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d4439a80a6mr450473285a.41.1751027627297;
        Fri, 27 Jun 2025 05:33:47 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm52217925e9.0.2025.06.27.05.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:33:46 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 27 Jun 2025 14:33:44 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF6PqCY/E6H0Mc2/@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX/E68VA8eI5AV
 ezCdHFZrV8tNJuIx+5Su/wR2Q7Wwg3JTjflVonxeqgYd69hg8ahZ/An+7EWYKcs5pjMenLUsUZw
 KUsKcqJPg9BcGGvBq1AeVPLZ6mQ64c4Zocez7r2pwm3ykfNUvepusBqdkyevMaMR8D/POM+V/X4
 UuGUAd8zFb1vnXiz/+no5Ms1dRqGSpvRvbB/0oHErXOqkIHhePmDCepjMnYwmpOcEhE9Eh3Wo09
 dUv0ZA/6WmCb/x/OiSGZS7oOUZ0IRG8xpKXP1IreyxAfp4USyVCGNxcAm2fBpZfwPPknjjpKuzQ
 hiOVwBPyP6QqpVgA5PGFts+QoPYl+ai40c6bfaLZm1e817GvbO/aMvetGo8dasztOjBo8I+WiSm
 RnW91OSiaN910P43rkw47RVI09M+VfiDovf6A2JhiDUkB9nDc2oGwpr3ECurci4wQuYW/ddp
X-Proofpoint-GUID: D2WsRH_aoVgSxrW_dDz4jugqmwKFtgiR
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685e8fac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=DfKWsWQFUtAST0jsyLYA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: D2WsRH_aoVgSxrW_dDz4jugqmwKFtgiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270104

On 27/06/25 17:40:19, Vikash Garodia wrote:
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f49ac1c1f8a3..5326c91a0ff0 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >  			#iommu-cells = <2>;
> >  		};
> >  
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xf0000>;
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "cx";
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
> > +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +			clock-names = "core",
> > +				      "iface",
> > +				      "bus",
> > +				      "throttle",
> > +				      "vcodec0_core",
> > +				      "vcodec0_bus";
> > +
> > +			memory-region = <&pil_video_mem>;
> > +			iommus = <&apps_smmu 0x860 0x0>,
> > +				 <&apps_smmu 0x880 0x0>,
> > +				 <&apps_smmu 0x861 0x04>,
> > +				 <&apps_smmu 0x863 0x0>,
> > +				 <&apps_smmu 0x804 0xe0>;
> keep only the non secure ones.

ok

> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +			interconnect-names = "video-mem",
> > +					     "cpu-cfg";
> > +
> > +			status = "okay";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-133000000 {
> > +					opp-hz = /bits/ 64 <133000000>;
> > +					required-opps = <&rpmpd_opp_low_svs>;
> > +				};
> Fix the corner freq value

can you add some reference please?

I took this data from an internal document - not sure why the downstream
driver supports different values or where those were taken from (AFAIK
they are not supported)


> 
> Regards,
> Vikash
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmpd_opp_svs>;
> > +				};
> > +			};
> > +		};
> > +
> >  		mdss: display-subsystem@5e00000 {
> >  			compatible = "qcom,qcm2290-mdss";
> >  			reg = <0x0 0x05e00000 0x0 0x1000>;

