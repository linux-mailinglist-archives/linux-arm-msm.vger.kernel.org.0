Return-Path: <linux-arm-msm+bounces-65475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D044B08D84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9CD71676EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9F82D8DDF;
	Thu, 17 Jul 2025 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXv1jUaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965182D8791
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756708; cv=none; b=OLR/u4zK1c0E3Fra/1haivF8hgJ1ExomjRpge767JEYD/X2f3Lms0FIfctboucl7P08c8ETxZmADsk65jTEyXsTr/g6uZYGZAyW98KkiPMJvS8oerT+7LxA9uNGSZcxl1ETw/A2+6AV1/oGNh/6D2nQXykILANdEK0JSfCRhFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756708; c=relaxed/simple;
	bh=avnk6sc8EHSeOS7ES2prPQK2MQlrFEYK/e/4co5pN+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Le98ob9csV6SQc70ar/H6ltoMUpZu0rueLtmJaz6CksQN88nmWF5fOx9XxjPHrfJ8sNEtg28DvVmigYnRDGn/2+okIP9tYqr6knE+DzMs8AABYf8YSZbk7LZ4dGTCf9fu3y61EyAO4t7ap/HU90o6Ht/fCZ1EESQ25xYIyPGeyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXv1jUaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5NhSn007301
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bzr1TaVGkOfJPBjDfmJ+dlX1XuUnIuMJk+rn5ei2Ok=; b=TXv1jUaGkMiw9z4n
	dxZrogRMLuA3TH7hSzGhmTxCMnpUsev5v6AcJxADvMStX7hZP2R86mq+jNWlAqKY
	aQ02xK2QZxM0KoEOtAvTPlAR+ExADu+01B7/wDDgWSBE2K2GaRxfClZPrfC6Ewlf
	48bHAH2kr2E3TwY1yG1pYEra0TPlmHN3vso4p00HgY85m7uU8aLp8oGL43kKCJP0
	n3rhrN7Q+vDvmI9IV0mCXXfN2COryDoDLVyRkqGRv16DLdjvOKo2486cWKqlIQ+c
	aaMnfS1lxn3LCvlpAql6isu75Bicl88AMKze6lrY0dPUwO5W4ZjmtLeETxWnoJzi
	PrTQCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca8v7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1fb57a7adso84811285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756705; x=1753361505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bzr1TaVGkOfJPBjDfmJ+dlX1XuUnIuMJk+rn5ei2Ok=;
        b=PHWLvAvHNg6+XolSQmFrsB6ytCrhJISxQqmeeay8Qyp3cWZwffnvcVarA2OUUKgkxZ
         lq/Mydr2fIBKIBubb9PbszT09n/lTifN1VxWp1XadkTNThhpxAj4TK7Wd9ZBzzGrPWMZ
         O8yoDuuTLsV8NvSjFm9N6Afkwai1L+LHpOTOAE3aJjxIrveQcuYgafYuqaufgj/22iGd
         xB30P/YV5ZqD5Q7dRnwgG1WPjXwGVkknxgV8/ceM+ZP9CjsJAok29DKCiPeUwWxbVvBK
         pDDlGySChVvT7oH73epbAhXuQdMRRs6iDgakEoMvYjDI16Acl/qApgSghZQYQgo7ysrb
         Wdhw==
X-Gm-Message-State: AOJu0YxxRPfiM/VOeAaP4ycYTIw5ygk5H3Yqdki4vNmP5+M7ubNFK8EU
	WZ0XRdcIp+ziPFRibX+FDZyJX6BJgrxzokl+YmEJqGQ1nn4EjZLKRH90y7A5JLts0ljXpyY5qWK
	nnUvvY7iPaR+0HvSxGD6OYlKnRE+VmieCmMUYmHC8+mIjUDNPrmfW/HwvxOcSHBEMx6WO
X-Gm-Gg: ASbGnct+7pu3XJVO939ekGBhoHJx23xr5qSWy8wuEOdtL4UzoAFx+T1oh7MGkUSU7ms
	zW26BQTcSXXu2be5WoBc5cGjcKbQyJuEWhg/k109sxWuiXtA8O3Nupd8nzA23n8lueYHxXcQfKl
	kH37VQ0mwgiMx3KKrPTVicRHuFnYxOAnvcp/ORV3w9zNWgRUtPl6smIxizJ7IwYWU2BNuwD3Tgj
	SiUI9XLWS1cxa3X/BQnDvmGmVNbtv9kRVQ8kPovN5nk9BbJf6z5zBn7G3aiJ7KXw5x00SrTgkmz
	MR6BnJNmblwo/cg83UPtzrOfg6rn+uch1rQsQd+4IBOjaCgMlvt0EJLnZ0+ehNs/k7fxg9w7svJ
	xpXfE71SNT2IzY26KL7wHovT7XpIiq2mbU6KHszSnY7YZ6IEEuDc1
X-Received: by 2002:a05:620a:63c3:b0:7e3:3836:b2e2 with SMTP id af79cd13be357-7e343617261mr981667085a.48.1752756704298;
        Thu, 17 Jul 2025 05:51:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBrP9UwwmwMrpp19kw5Ud4uZADb4Qpf7uPsYlVY6B9Br5gnf+nzoh6J5bkwRBddYMkvgY8XA==
X-Received: by 2002:a05:620a:63c3:b0:7e3:3836:b2e2 with SMTP id af79cd13be357-7e343617261mr981661885a.48.1752756703651;
        Thu, 17 Jul 2025 05:51:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d08fesm3032872e87.126.2025.07.17.05.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:51:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 15:48:19 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sm8550: stop using SoC-specific
 genpd indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-fix-rpmhpd-abi-v1-4-4c82e25e3280@oss.qualcomm.com>
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=avnk6sc8EHSeOS7ES2prPQK2MQlrFEYK/e/4co5pN+A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoePHYGkw/Rph590C+UEwl4DnZrUOVRJn+NeX96
 gfPgIBO3pyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHjx2AAKCRCLPIo+Aiko
 1aY5B/4ktrdchoWj/19HvXv1ozvYVpbwr8rM1boFE1OPTarm6mFCOYCl+Fxu3Xwc0LjF+67NNk+
 eRVihFkq7YPWJmVPEQhjOieEtalR1r6hMDGCwm10nBBdbxD5fyxUeUgawIpDAYz4yNnTCQC2/ya
 e5DFpX93SZV0rXO6b1wiX2sB7E/0x0KDnhwLYEvDYOCGivZSkYxcDbTAYjOnWpXj9gSSHq833rx
 DWx9/OOlyEtYa1GQa2mX8jTSPqeWBHiCr3XOHiu+LeoStGdkEu0tVv3Al3AvVj6V/NdIs6x2/xL
 fKuRO4YpGrsx3gxqttwbw/hSiGOWVPA0dumdcNpJBr1ci5j9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMyBTYWx0ZWRfX0ZtzBc4vePQY
 M7nRwJIj8SyyqB2BwETMV0burgXrRNS/6Tzsjwxwjpl/0CabmNffZ/faNnf8SxFwZrE2OzbdyVy
 6EgLxLKfF9wkMxJ8Fw9N2CvPSQvCb7cXDI9pjNWLrZNFDE9ESHlK+a1ATE44zVEitQr2AaDfca9
 1tpKMHXm5rcs0I3+mS/ZxM7QiszAzpVG/q0H7Yvl2OItmr/dPiOL2+F5Rb7KO5OkwQTV1nsrYuO
 5FipO+/+lsmrpFcsopRsUdSXj5ID1plCmmnO0a364sktydVNVuVfYTfseSfwVQKb/6vf7CyHgwE
 APdxauaaupbj+YYF+9/qKJqxVO/Rxh8FqPFnTwl9Ry2AF5Pk3ZcbJkV0cOwpckpJiWi8q7gXo2L
 2DgtXhK8WtnnUMUR6Mk3M0N1r8+VUSelB7bmIWVnk8LOuktrKeJeur5KZwCnDkWnW8a718E5
X-Proofpoint-GUID: HrzpG7Dd6MJ9kACkBkzMlh0A-OuSusn5
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6878f1e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=e06P08YCo0CmzbESZgoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HrzpG7Dd6MJ9kACkBkzMlh0A-OuSusn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=769 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170113

The SM8550 has switched to RPMHPD_* indices for RPMh power domains,
however commit e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock
controller") brought some more old-style indices. Convert all of them to
use common RPMh PD indices.

Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 45713d46f3c52487d2638b7ab194c111f58679ce..a4ca06679c2f1eebacdd5938e380981c1b17925b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3623,7 +3623,7 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.39.5


