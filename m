Return-Path: <linux-arm-msm+bounces-97252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG3qMd/asmmCQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7602745AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B8CD3159B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FF13C73EE;
	Thu, 12 Mar 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neVENLHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WN7gXWGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77403BBA19
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328472; cv=none; b=S4mPa1l8qgPi5bofJYl52PkTDigsg+0vHLxX/rpGBlNNpe4ktKjsrrrV9nm/+dSE2VAijCgCTzNdajoV3n9qa5pudjDdTdBTbEKLSxbiQm8fupGDz5+XxIim8ybtII7FORRg/fqZ5Z1JLUp2NeuqTQyYAz6eVpaf0daEvKEnq8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328472; c=relaxed/simple;
	bh=4n+ezeOsiG6jQ/rP0xYQ+auI6P//RAr4Bw4iQYpjjmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctqg920gzuioPohYiBGmYxPBjjDGJjgtvzuIP7qHN8hNGkL09MDnJlZ1Bq5dIktGkZli++27CiIbktB/rLbvT2qOzq9EtM1uPqSuMWCooO3JkeVSi9ACnvi/TMxJAckfif5vM7xj8jiSml+ouS8z3sXZ+NQRF8lmpr7Hg4dF3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neVENLHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WN7gXWGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C8tFjX3136575
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXuXiqLICsx00TbPqwOiMD8zMxqcG0nuNwwmGa/0IMw=; b=neVENLHveH3Vocdv
	DjmdLi032VsRdBCpoCp3dk3+mxkpmeWEqTa7cPaccX6aK7I6HqWU+HpVYnNJh53a
	NWZmwCMmgAt2MEA4QkL8KS6wbaxigVsOJDznMn5frLwvgvH/EecVE2MC+dvq8+j1
	GLtEc3fCxnUd8bAsBB7ui1SkBX6MJFv+GvrjRMr0WN8hJRuLt85ObK9w4xo5SJ7m
	uXa+S8eJ1J58/ifhOCzlNQ8PAVtYxHVSI4IlPlLS3QglJKG8XDnRQlMdTgHBXc2A
	dmJYH1c25dt38H2XGKl1l9O+duyONTWMgPOqGhGqFiG33fHavrHzImg4VpFB2BDE
	jRU2lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wahu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so495533185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328470; x=1773933270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXuXiqLICsx00TbPqwOiMD8zMxqcG0nuNwwmGa/0IMw=;
        b=WN7gXWGuLg1Hlh538UERxIuFKNA74vKgwDa8Xyc8bEY236U1DQNnGagxCsEF5xDMZg
         b5JL6/gWTQXQaHELhSrNZ5byBxyQmZJI4SdmW6lENa0Rq7g0FiGxqA4STjGwChyi3AVr
         3Od7RlHU79Y266vTCTZ6ZhTI4RVRD48oiQ76KVQeCGRpV4oKHXDKmbD17xNzeziMST2N
         YY5YOyERXmRreqMvGH7wjm6M3EVTw9wituaUXgF6jWw36HehskbzzBAPF/TcbqKLbZZp
         bbW7ZR/kOqid7PFtrBTHmPFrCBy44MMz/NzOrr22mXt160xCLA5DeMVgkQzKuZjylzGR
         VW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328470; x=1773933270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXuXiqLICsx00TbPqwOiMD8zMxqcG0nuNwwmGa/0IMw=;
        b=sawBo2c5Q7RvANA7rT0Bi7Z2wLki2iZgBxus6NrX4ogmahVlQRTCZ1II4gHrcUB8vP
         tC6ORpnBtH9JbDYpnhAmNqdoDjstiTbhKbHY+uuomzj+tT1WWNNekmLGvtKMB1LbEGGc
         rAN5I9f5X0eWpoqlBpYnnEwkT9Ac2HbHa716osv8eDTD5ZQDNYpn5Yq/cbVljxc5Bs6n
         kJ+1sAPtQ3w1GZssdWWEAyZWmjPKSg4T3wUeglVHK33zodeH9m21Q/4P1FrTU3VZSY60
         G37rYNbgfAzb3trH5YkLGKErHTfHnz+9nQll6+WfGhd2IHInzqHW6/hU/c96snpMXUK5
         s+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0MuMmo65jsRYei8LJQ0p6HBvH4nGbvpSR7DXVaPOifHCFc6rz3myYIbGm3j4MAepWIZdQ8NxVuccWRvZl@vger.kernel.org
X-Gm-Message-State: AOJu0YzMoNDU9E3TBJFiMLC2jLUnFQ+/jhllq2IYYSg9b7RzrGpANAWR
	4Kf/+jpz/uOZam4Dsvd+NJO6hYL0jBaF+z+PVqS50+HzmQ3yjm+d10Mno5gsXGWoZ1IwWKDuYKq
	VzxEWKpBxf+r9cGAhxtWz2/Q7Lry7qdEuxsXZ9OpZpPUnteLMXueWrMsYhEjrz4Jt/wxw
X-Gm-Gg: ATEYQzzNx/K8IB3zjtQVw/OZIWRKXl5JgocSt+ypPbaSDUI26foRCPPrdSgEVy7+Haw
	gelL5+JJqA+ahPKVpyfze5a+z/YtXviqTa7OQUPxRoUe93Dyj8EfC0kXYPxBOMUx5yIoc/zG8oi
	/NYCA1gFq+7yiZlRmGv0eJi7jQVrrOWeQvKbudbqxkv9upxkIiY80Wv8NvROpm73NkCJI5atBqK
	/pkbYRupG4OIo42+y3OumOSHGqJB28Ol/hSh1I99f6dz+6fZ6Pb3U1U1mmdsm1Zz4mZg4k/seG8
	z4Crkj84+FakMu3Mr6T+bUIFWpZZxvkno+h/zwy80odi4492itlpVrUfrLST8dhjWUkV+z2sKLR
	cI5KClNRcjfdq2XAnFLr4zTt2YRj2x4GP0s/ZvPyDkj7sMhoMVgSLbB1fSIDph/Pc6hhZxVdl3e
	5Z5LhxNJO41Sxzg7v9exZ3u3r9zF5Wf3Vy3Pw=
X-Received: by 2002:a05:620a:3193:b0:8cd:8785:eff4 with SMTP id af79cd13be357-8cdb5a3fa29mr10089185a.15.1773328469301;
        Thu, 12 Mar 2026 08:14:29 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8cd:8785:eff4 with SMTP id af79cd13be357-8cdb5a3fa29mr10082085a.15.1773328468749;
        Thu, 12 Mar 2026 08:14:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:22 +0200
Subject: [PATCH v4 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4n+ezeOsiG6jQ/rP0xYQ+auI6P//RAr4Bw4iQYpjjmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthQvfr9gHJIu/Mkgc/jIphCnUKy3xyHBrAts
 camYccWh8uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUAAKCRCLPIo+Aiko
 1R/AB/45dWMySGjoQ/Uo3aboOrOiFFBNOoZQlEkXdwF7SvCbzIHpVSb09nOIpow1Xg5m9xy1tV/
 b9WspjWN1rGdpNQiC0A3CFIjuqYkLVXfhbvapLv9cfWiuCGPLQzg2uCGmJ2qIGaMBY5xdv6Osul
 /QRRMIUFyZE5YnYO40TOPBjZ9Ldq1yk1HBF8fkYSLY1VJJhG/CFCpdu/cKmrh/uJxa970VDNEBV
 fNGyQlYGt9PV12l0ePQXRPTDP6qnt+vkfXvqK+KKcsx27V4R/QnJSGabJsF5179jN04WKIQ9hgz
 PyK3aXdfMwPBTBpuK5sF+INC9fD+tDek8F6GjpYldZHd/17V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JPq0mRIcYVVyNjIODKbTV5eD_li-4-RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX+JY9PxDFh04p
 R0Bzn3fQ1ygke5Zg3l5JAzb9Ood65Ahh6cBnb9b2S0RdZOXm/Nh0MsSLPcq+MJHG4viHoo/Aj7/
 lP58nskkWf/xyIrOeznMhFCJ1aGvvhx+NDtxjAPyzym0lUCiym9OUechRcTLff/0/Q8fEvHys4w
 CvtTKFxCnRROtYLh0IFBI7cG+yNNiS2r0DmqswiQTZcpG+/SHr5QewRjsVrOkTldor60/TA0pGB
 23GvdPd64Gyg3wjU6T9QSSCay5496kqcdB2tf3uBR3UjF/4c98VF/Lm+3rUCfZgKAt9BETo3OR8
 Z9y209bpKZ+rwZg1eIMtq4xsMpnrY6CBo2tVtv/AVHu377aO74Uy2BrdEz0uzjYanm4shTUy/Rc
 ivhI+CKiU36I5ykT2BQZuTQo7j4tsE0hL5B+b0SNWRolQpr29/KfFsj81oOFrepOR8rT3cEJsHZ
 YkeL52l9tQSo89HQcQw==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2d856 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=5xS6gZYSRwgnaRfeS_sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JPq0mRIcYVVyNjIODKbTV5eD_li-4-RU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97252-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B7602745AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Document those two IP cores, using qcom,sm8250-venus
as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..3700f8fe91cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
+  The Iris2 IP is a video encode and decode accelerator present
   on Qualcomm platforms
 
 allOf:
@@ -18,7 +18,13 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+        - enum:
+            - qcom,sc8280xp-iris
+            - qcom,sm8350-iris
+        - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


