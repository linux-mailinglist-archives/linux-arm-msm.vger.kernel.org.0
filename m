Return-Path: <linux-arm-msm+bounces-75317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD471BA3ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC8C1893D04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564162F656C;
	Fri, 26 Sep 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq59JsOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ECB2E2665
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894256; cv=none; b=MbF0Yu8baI225n8LgydFGw/eNocijbJrWIdQekrqOiWCExc3p3vuasGWrmM6y3BlCmjMn/JfB2BgPQVR2HSdf4uWr9SqGba+lzshg429CsZCGTk8j0PQ8jKdjnthodmNqw+ttU6gxUU6sKpb37EXppLsCzsE7DQb9Wb2sStJIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894256; c=relaxed/simple;
	bh=rdkpd5UFhIvMoKkheDu6j7UaKkgSWom4KRbRDqtUP08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppGNPZ0xUFb68MD9BlnLHHty3kmEf9etlCBUqI3MgvcjVoaE2eQqsC09p11FYUFN3+I0NrNuSECC4+Rf5CPqXIsXCpGfedjl1ECPxk62eDTvT8AryJyNnuwfogXAsEyZHs2Q1ThqMnEvY+BJvHSv+4+CgO2WoJNQuv0yDR1Q0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq59JsOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vY7i020680
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zcW5ackSCGXXGsejxqAPsV2N
	YhpDYtWknaGVzrpa33c=; b=Uq59JsOA+QedVYO//BqllapjrIr5Ts+C6i3brQw6
	LeLmtGwhvPzqfltyLV4fjStKZRSco05xEoG0/Uh3R9wozt+eFFpCXgaAQc+IkxNL
	Z2vl8djjXLwdwVV5MFbsCuuN0HIDgb+A6NakIoTK7czocxS0KrlWR2JdFFi3lv6c
	j+MqOX7817azKee6BGSFX2qncpEbMyp9mKNBxadwwJ8zLZM0ToBD02H3exn+8q9z
	PoZxA0iUzZqrckHEV2ybsd0QBKyv44DyhagC3M2mMzNSMcRNUEmO9RIFUrfQL8BP
	K0wBEj+cQo0W1cbAljfLnY2JqTQ+Efe1pf9jpOJ2FnoL/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qu1s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:44:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so49275971cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894253; x=1759499053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcW5ackSCGXXGsejxqAPsV2NYhpDYtWknaGVzrpa33c=;
        b=Ntx4qhr2r01ZzPOlQ9NUxanXQ3PNc3ToIn7fqMxqTd8/M/+HI9U2kcvMCVUNELFKdm
         TWjibjjfqpDY+24XM34eNi+DIlcfugQZf8zvO/ddv6vidFQSbNM1L5H+E67iejGi1e1V
         KjrCFcrwQxdvd529JW9yixIMyHuz+jSVSmSOrDYuOQIPnEzYHdmnWQahY2KcUSfenpzf
         CPm18vpgxpCV0wOsDFDj2OAvpMr95Wvt9BDHsOMIGnD/6aWBOkCQgCcNgdQ8P37bh3ej
         YblwHqWMyNAPEQB9yHNOPHOvDg9TsShVX6Dh5y9+1vKTlCIJZu0aCwt1kQ/xL9OsLjKF
         l6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX814EtLgTbUSVh3woeCKcI5wZ/OPIVG7k9cx3StfXlLSy5EKYkK4XKrcNOiIfpbeEZsps0WxnCPq54OU5W@vger.kernel.org
X-Gm-Message-State: AOJu0YwscNolWFw6X/240ZHMSFSM8vZNc5I/QmUivm+DHl2ac69asSqZ
	VhCQmsJ0LkoOBDniCxFE/vEcw/nw43M2kawGp81r/rx8AEipUJFbRe1cSPTgttTtEboRQujoRhf
	0dg3kTXaXhtRs4XxOmjsidu1glRDTppffzHAgovCn2jEgtvR03S0mZOawyxNKCiNTfzkz
X-Gm-Gg: ASbGncvJUW+XXNe6dhpiQhQN+cwWdpKM1HZSasXE/SbHOv+JkAV3U/mS/VvVHA8pdUW
	x65pqnnQLFqjxHK0ESI7yTiTHyDtx01UaxT3jo2+IngEsAqQQvhgKJ75+Gka/c4gCloTfL1HmtY
	jf+tI/AsmlKbJ5jyn40BPYxtvusmK1hFyak+rqjQoGx+GY48zmb4cCkZX2eRNAuy8LoyxriKmfF
	ssfwPTCKmJcl8xWAHgRVqBcOTxd6lyH5mq/F41Ytr2JiP9q3lw06brcIn1qy0qvlv+G8K5jLIuN
	K2uRCfDnVtMWXN7D0RBNN0kov8C46/J0rMjly2GUn/0bxkaPtxviS5JJtrJ7AUQ4LnSnHGx5zIn
	7H6X08vH16OC54bbAS2pkhN4/e6wmVcxttKPWkZjd3Y5vXLMtpI8Y
X-Received: by 2002:ac8:7f96:0:b0:4d9:d5b7:8798 with SMTP id d75a77b69052e-4da4d22035amr112094761cf.63.1758894252603;
        Fri, 26 Sep 2025 06:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnptO9V665rCbkqw0/QJIvszxBFryo8Yk73k9re5pF1c2Mu0gMfrvwGqDKZNzwvy4/lECGEg==
X-Received: by 2002:ac8:7f96:0:b0:4d9:d5b7:8798 with SMTP id d75a77b69052e-4da4d22035amr112094051cf.63.1758894251760;
        Fri, 26 Sep 2025 06:44:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665640bsm1832691e87.83.2025.09.26.06.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:44:10 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:44:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sm6350: add refgen regulator and
 use it for DSI
Message-ID: <mmtoashmdv6cwwwdg7rpbk3kkrjddej6khdzlcyo5qb47lfunm@osemmb3z4m55>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
 <20250921-refgen-v1-9-9d93e64133ea@oss.qualcomm.com>
 <DCZZV93PMWRZ.1J9IZBZYP5RGM@fairphone.com>
 <4d815ed8-18db-462b-80d9-9768b51a9788@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d815ed8-18db-462b-80d9-9768b51a9788@oss.qualcomm.com>
X-Proofpoint-GUID: vTKNKCliYFoDTi8QnUFnJWFlS_w7poC1
X-Proofpoint-ORIG-GUID: vTKNKCliYFoDTi8QnUFnJWFlS_w7poC1
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d698ae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Jt6MlJ8Wm96tuLkM1H8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/hDfuUyEiDle
 IaZmUMmLtqvgczUfM+41Io7QifCV/xDrGXoMY4zXnsWHmmEf7RjUJnpndeBFwNd+zO3u1tps1Tn
 D05JSR4CFpt/YqM13q+fMwoI7w+Z/ElxycHYM+AtySHx/urGkdXEhF4SqsPfczzRQnR46eCfd4g
 EQoHIAVxNM5m8YzN4ttcKTWuQ0QEoCXQB1Hk9L2eG/qPYOHLCU+8oWSjpN25YY5w1Fdu/UZygx4
 8AcqwfvGf5zVMm4gxxIGz9NPhrxxO1gXrAlm/kHxiyq6iMenKAEVVta4Pzwc2sOtAlDE8R0eF0W
 dw7kSllGFKLCOxoShppTCVONZZGeOVc2qgZlpkrojHZI3zwC2219kaEHxGzAOwrYhJrIQ4AAeE+
 iR0dS73gYBxBdx1jKdGM3Lq4c3SOdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 03:27:24PM +0200, Konrad Dybcio wrote:
> On 9/23/25 9:17 AM, Luca Weiss wrote:
> > Hi Dmitry,
> > 
> > On Sun Sep 21, 2025 at 9:09 AM CEST, Dmitry Baryshkov wrote:
> >> Add the refgen regulator block and use it for the DSI controller.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >> index 8459b27cacc72a4827a2e289e669163ad6250059..dd009569a6683a25f13b068e3e0bd8746b2ac501 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >> @@ -1768,6 +1768,12 @@ usb_1_hsphy: phy@88e3000 {
> >>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> >>  		};
> >>  
> >> +		refgen: regulator@88e7000 {
> >> +			compatible = "qcom,sm6350-refgen-regulator",
> >> +				     "qcom,sm8250-refgen-regulator";
> >> +			reg = <0x0 0x088e7000 0x0 0x84>;
> > 
> > Are you sure the size is 0x84? Downstream and hwio_bitra_V1.cmm would
> > suggest size to be 0x60.
> > 
> > For sc7280, hwio_kodiak_E5.0.cmm does say 0x84 for refgen.
> 
> 0x60
> 
> moreover, I see that there are two refgen regulators..

There are two refgens on each of the platforms, but I think the other
one is used in the automatic way. The HPG only tells us about
programming this one.

-- 
With best wishes
Dmitry

