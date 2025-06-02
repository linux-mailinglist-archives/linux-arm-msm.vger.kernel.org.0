Return-Path: <linux-arm-msm+bounces-60033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 639ECACA9E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0CC1892400
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 07:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DC22C325A;
	Mon,  2 Jun 2025 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liVC8gij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1D143736
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849035; cv=none; b=Zhp73PdX/fWWhCYcS/HHX/XT8goZJx7eM0x6KQzTbWMhPnL7WcWpxADXRgi3IgIilagHD0mm/fPNCtRQ8Y0sNsrLmw5ReGZfAbiz0NdXdtOTB4EP1Yyq4u3XMd4nSVM9ZC0yXngtO+DmtQQe1PXJO88QR3BeBXb8wH5dkdsVsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849035; c=relaxed/simple;
	bh=CBMo3phr83jgUMZt0jAUHfVtoIwsR8eJ386zFfEoaeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=umcMTF39m1Z1LWnzbRFqIdyDRco5TStepPAPE+4bwgfjYFGSIROmIn+NeD2aitdy8pNQoMYbHs3v1JcU+fGYhxAg1LYtsMjmx4Oz6ZvhPikts+2MG6GT3BorEV/S0wQsacVxQS/CplgqW4Y9E9Tw7q7+LoPH9ggEuKBwIduOwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liVC8gij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5521i2dp017335
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 07:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s5eocu6KdfbwskievOHz6Y
	oQu6IRRUX5nAFu7iMHziU=; b=liVC8gijDD+weKUsy6yL44vlqnj2ih1Ghgc23u
	ghpzFY1WjyltGL9FaJJLrNeecsIxXFa4/OYpgkOMoCScGsP0sPsa9Ro0/PkVflB3
	BnuPqF88t1qeHztTvkYcT81YIKiau76tXpJ3En6CRjG/BQr3/UHIMv9DGqgPs6Pz
	dUw/7Ifbuz4/0jXnn/xo/n1eCob7etq6qFMcnmC48VZTbT20ct3JBUTxRScMjlc3
	Xc2eYTPQlKzkxIBvXX1zB3LVjbw1nSASTEY5mymX7+LNOjydQVGDXTLMEmFfPELe
	rZz7C+CbrjqwC8OHNK8+5Og3QEQ8iG2JKPJpEoZ08MVOReCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm3na3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 07:23:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so179746485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 00:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849027; x=1749453827;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5eocu6KdfbwskievOHz6YoQu6IRRUX5nAFu7iMHziU=;
        b=gUv6b22tdaiSXW8IFDhPAPWiLGiSZZaICE/ijGewUBQ3zTkLqrkDwp/C/idy9o+TW9
         ukqa6mHL17St18Gal07tjSkAerAZ9GqKcfIAWm5z0KzARpbEKgKZS+1G8aZ8ii/7KhvG
         fVl05kMMk+JqJtb5Gf0ca4JZn3eP+7/ZVDqZOzJjWzyc0RfKmfz9iaKKcqP9XXXcSHeW
         /u+d2vMRGFvGDBigNsjQ8xwlUwLY7GVNfOsNQ+IkCrLZXzzdSBfGdirCw+kWuAPA1MQr
         ySDF2o+nIwUeqNn6reawM18QObmSazwdKs2AlzURoObS5cRJoHb32f61yP85PbKjqKAy
         ZvnA==
X-Gm-Message-State: AOJu0Yyevq5zqTO/A2iD1vsw3rZnqLbn1eWPb7w6K0+sad3FUxPQh0n6
	c8wB0LP/s47Bxt2VhMSCXvdd2PAPBQzEfmRk8HGlJP3xgKSbmGxJcOHaTSzrRjSNB8md08rz3CV
	0tyf4/oENxMZSJik3OZLoEa6YziwVtccOaHB5k8feRzCCIlhPN7o9+szadplGmPO+MioLWJNyvj
	nZaao=
X-Gm-Gg: ASbGncu5P3CpU1mVKVsXDF9IkzaTODzh2lhAua2Hszi1I9YahcyFwH0m/qET8FLYywt
	VGbDYRMp5V7r4JcfDx7oPXBVR0qEHzGrkSqnlQ0ZD0QrVINxanUd+R4S9b+r+j7n9r18X8LyJ21
	EYRy/iv9tBV0THNbnhyUm1s52FcL9lbnCrueJpS+Aln2iQ9g2WOUQS794qRCOvQp4v1wpWYI0mM
	f65aui/jEAGDiiBej+4UnCtw8Kj2hGEMJQ9S58KNAoowtB3sv8OtioRqVDk8PIPQiaelnS9AdKo
	DNj+fk/z7DUc15IAZ7nJw14BIhWow5/wIDvFPioPA2VM9rCXC5YqqEC2jfkxYK8gren4Ky7Nf5Y
	5N/FWMl1EIwBUtMBpgrZFC7XW
X-Received: by 2002:a05:620a:4395:b0:7c5:4adb:781b with SMTP id af79cd13be357-7d0a49ef317mr1875730685a.7.1748849027687;
        Mon, 02 Jun 2025 00:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9X0R68E0LR8x13//Ryjo6YwI+eu+JAVFDVLT6gzXGpkgI0ipcxWqMxe6MCHG0NjqSq+7vDQ==
X-Received: by 2002:a05:620a:248a:b0:7ce:ca97:a6bf with SMTP id af79cd13be357-7d0a4e5263emr1714898485a.41.1748849017202;
        Mon, 02 Jun 2025 00:23:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d46asm1506607e87.47.2025.06.02.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:23:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 02 Jun 2025 10:23:35 +0300
Subject: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow the
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHZRPWgC/x2MSQqAMAwAv1JyNlDrUvEr4qFL1FyqNCKC+HeLx
 2GYeUAoMwmM6oFMFwvvqUBdKQibSyshx8JgtOl0rw2KG6ztDlz4xngKGvKtrpvQRk9QqiNTUf9
 xmt/3AwvQCXlhAAAA
X-Change-ID: 20250602-sa8775p-fix-dts-2eb4013c4dbe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CBMo3phr83jgUMZt0jAUHfVtoIwsR8eJ386zFfEoaeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoPVF3Zrk5u/MQx2/FPnPzUHbdt1p8IZaKdfCdb
 xyyyycFzfuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaD1RdwAKCRCLPIo+Aiko
 1RpfB/0UBjBA/fQWxqPvppkAmBJKv/kPwZHnMh6h/dBCmuR7HOh2GsmOADgnBcXfZjaRB3tzuq+
 coL33ywP1DyN+goQaDsmCAslSrCZ4nsBZvh3mDycFDj5i/xCFaKbrDIUcIP6AuzSMr94pISio6D
 6ASKwWgZcfXzNmdyBzypxAtgR2q70Q7M7Vwk/7hB5dwbAHG7u62tBNlRUVR9u5iz+kt432+kXtx
 F3dyx0L9/H/cgjzrUmZfFpPpCmpqhfw1/n/yHpxC5bnyI+tuBTBc5dnDQjwTMx68EN3E3KQ3SQQ
 7Y4Ls+YyKifLd5gOLMyHwZq0luiRbMsTKQYsYTlrHKKCrMq7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: DAsBQQ8if8YuLB9h3Uado83QH5JS-e35
X-Proofpoint-ORIG-GUID: DAsBQQ8if8YuLB9h3Uado83QH5JS-e35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA2MyBTYWx0ZWRfX4FITEGEVE/vB
 OMTIux6jnASO+u57Xg3MKZQvUPkZ/UEVdzLxnQ9uzx7CE0Di+uUSRvuYb3wo5N5SWz3uAeLAJOi
 M9AxqH40U1LbM7CbZNnIO3zTtfA7ZQNdlmcRJv/HfMEX0KQ6F4INiApl6oEOH3PqRWMGuqNFT5R
 SvEF8UJVdKO9PdJgfxXs3KUC2ajtcgPKCRzN1Cgn8p9Xt0VRZBePhidDdi+oJNMraW5Z4avnpGJ
 x9Rc40mnWSNUlXTKzVmmP3H4O1z7ZXJFzyHjX5ub42GWrUD8p945JPTgsLo9AFJ007kVEIQdgqE
 nYg7A3VmsRdDH/ETOquPE/GhbCNfA7dLqG7PsCD6tePfEDyr4BXzW/7A+fnTIaM3taHrsWN0807
 8M2Y/4deypD0jRVSOd5p0/BkDEoe99t7nHz4SlifENiY9gF2soqJhLxHO9HCKe2uDRzUMosk
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683d5189 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1MI5CES3H8l_R7eW8KIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=898 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020063

DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
not just "bus". Fix the DT file accordingly.

Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "bus",
+				clock-names = "nrt_bus",
 					      "iface",
 					      "lut",
 					      "core",

---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250602-sa8775p-fix-dts-2eb4013c4dbe

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


