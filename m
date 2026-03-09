Return-Path: <linux-arm-msm+bounces-96249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dk5Axi6rmmxIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:16:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55828238A15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0EC430B222E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CEE3AEF42;
	Mon,  9 Mar 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ff/FXfFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz8jPPvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F603AE715
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058122; cv=none; b=Hi15/3YlJvmtcxWFiHY1gqi/lRp0RIFIaD3xXyLitiSbtGclU6Ep8jPJPTEjdWu+jKnikeC2dsoGGyc4d5Q6ZZyiWIN9tmPMnl9rpRoR2daXJNe1hri8ehOEKUwcSD4J+Zp8vsoiucdVbSUpNi6DI0R0ZATYlZN7moMxB7QwziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058122; c=relaxed/simple;
	bh=rHJsocNfNwVm2MjdpQ8NBJ8I/rjbG3Qcpok1Ai/CgR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuDTKL9ag8BjuxyrZ0Lt7jxUWZO+C/O1y+It59E3oMDtLI589Q0dhNJnwjJVrZ/axYzt6XKPwSYkmpU8bfEcpYjn6etF0TjWawBk3LjL40c4CNYYVOELAsxHQH4SXHz4Z+2WBqaREyOccNNuZoVADEWdb4kzneES5ICgp2PN63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ff/FXfFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz8jPPvF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6dEG2195101
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=; b=ff/FXfFO1Nv/kloL
	hHHcEksr3ks58rS+mDhbDedoTIDzTmFikAcDZIrIQUpouX7z4XOSoTJXwwqHstX4
	ppOHxW+BK4uHaa4OEDdxatyGADI1F+aa+MiQU2kG1eIdQgNOLYd1gL096NM+JqnN
	SJCnuZ+yLAw+na9VJtwBPJBhxU7lol+PLaIuKHVjXueA/bHwof9VlhmiHMmRdbSd
	DV/WRePohEJ1w0eCsK5sCz6htatDrM69keGjPYS6BYrovc4xZ5BJs0Mcy37WjlAs
	UsuAoQ6IamZUh/6WRhbBj3xPpYaoV2hWzUfmJTiBOSUzT8nqxpCjcDI3zopixWTy
	5oSHgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u8ctb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:08:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd85e08fddso977275785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058120; x=1773662920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=;
        b=Vz8jPPvFAGHllnxO/r4PXFmeu9rj2TBXD6fFmwfQEYYgrm1PK0JbhNiXUfVp7i/cF6
         UcLiGRErwMq3iN6RwKj0idXdYqE8WD9v5PYDArx91VvNYqwaYo3voJuSBTkvP3E8sg2z
         p1gjumzoK+Pck89gzL3t5HWn+4gsxcCS0IZbvm6MGFi2hxOpvT7SqVISvnVWHnsVeEc/
         lfmf00J8rRZzIPHmY0MwRSlb7/8ldqwcgf301QfyAm332Dj8o3+ezVpGgMtKktdTZT5A
         EaNzJ/IAX1Nnv5HubyEQh5MzxVkUg9NNieb8JMKqEMhrG+KSX3kw3hJ2D2FRWs9UKXt4
         ih2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058120; x=1773662920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=;
        b=Z6hZqCNzdhcQSUA05oN9tcPRZ0sUrCF31BqU/3n9kDshS6D3J6rPOQXT0PKOZCDw4L
         3jLOVawBCFvc6U2SNwE5yhLyJ2i/nm5kDyZrzp9qW9b2eBUC+uO1FgWyVcqqPoLsnkbv
         Tbi8lteQNUxShcUcAR+ijJo33A32raB7oGjucqGQhkhleJh5mUOcGuyXT45hkQhKJI3J
         Vo39rctpj2cFxYoG50UsQuuSRH3b4ge1srza+w3hE9ZLhP7XB1rIrlyNpvsNPrkOu3/K
         gRG5o/+HrTnpnBg2+luwQ+zkRR41OVxoaFvx1S5lhbDOEc/tibhhFVUi8A6/tShf8nIh
         O6gA==
X-Forwarded-Encrypted: i=1; AJvYcCVpTUKpVaz6qEmVXoc4fovVpUIIhMQY1qHVyw1Hh1sIqvnLpzHjG89uhIYpNEtSC/qFWCjdjARAOEZzLszh@vger.kernel.org
X-Gm-Message-State: AOJu0YwzI7XR73ok3V0SyIzBEQh8uvZ3IY79zCMfzMNNWrOsM7/MP9Zj
	JYTIOWnXeV6qVmXKybGM9FD8jOcFNnRVwUC1fZU4ACGzKfEwmQQs+Zz1dpUEc6iz6X24RmvRgea
	3mv6PdspVy+br/sbaqoo3WES+OzVeJzh1VO+FSksLDBh/oxKyyAHV9Tszyivfv2FAJSFL
X-Gm-Gg: ATEYQzw8n5AiRGMYACcM6RgZqWQP5Tegejm4qxi/6JYwj5zT3lrBiLdU7RulGGFqfTm
	gTGm6k1jgi1ZH3dIO7WHfofYvpDgclnmryCzfkkUfp8Nr5JCr/X34DbL+LbBX5C6o5UmVEkgMsn
	4jWwy7VH2E+IyhAe8ggRZvBxqsT/KBI3+H1ccWjF+InSJT5h31a8w1cq1f//qHZwcjZH/eRYyZE
	yPkJ51FHweje1ArV/s0BaIMfIKgjnE4POtiGaRkMkcvrnoMZnxQj2n6nMXOjE6MfNgbSOgrlaXC
	aBmm1dIubd/9TY85prVMunXgKT6vvWgqU0wYsG1/4UI9wZLha5iHR6MKEC3os1NHHOS1znk7L0v
	+HJLqvWohqAF5ZLWsy/KNFqltT7llIA==
X-Received: by 2002:a05:620a:f12:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cd6d3eaf3dmr1385357485a.15.1773058119492;
        Mon, 09 Mar 2026 05:08:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f12:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cd6d3eaf3dmr1385350585a.15.1773058118925;
        Mon, 09 Mar 2026 05:08:38 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853916624dsm107826075e9.6.2026.03.09.05.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:08:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 14:08:17 +0200
Subject: [PATCH v2 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v2-2-d7a58a0a9ecb@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rHJsocNfNwVm2MjdpQ8NBJ8I/rjbG3Qcpok1Ai/CgR0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprrg7pdKzLsmoD9r3Y84p4pzCxAzjF6qMpZDti
 NZ1INZ89UGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa64OwAKCRAbX0TJAJUV
 VlhPD/9uAIhNz83B5iwD7Y750ftbsKWYHtDGpIxAJFtvtXbxoC6zpc2FpV4F+0QpW3tv4m9bjIB
 bDh4p48tkr67lrSzzIegVqXXcMaK1z9SVZtz1JwmOTyo4buOR+0TofP6ObgR1R0HZRayV1SGsX8
 tqpcq8hYOLZnUyH0VjeoIhumGOKj/sCH7y565zfHup3YIpV5DYy8AGzhT1g6BfzJUaKaQMbG2Ef
 e3CToDor4wiKvBLAVtwF70wfTqGCZlLRch/PIqEFxbWq9oP7TATtLHZ/oWWVbQtPvw2xysTD/Bz
 o5gSqCCrzcddgBRRUPOr2s1lrwBT2HTYeQL8hRZZxLB+WmTpMIBtEVgrKSpQJfhNjennqbCMoYJ
 gBDvM1NcDykOC8Zw3ySk07rrUkFafqA3AM/6zOanMzNj6+ouWT0QR+yV1dHrcvn/XufYwXsOxJ0
 SB/VuRLOf8CpDXvECHzQqma2pmNbKKjajx7Pjo4gAZ+ikdvEygApWtuwLkTPhuc30NqaScmv0if
 Sw4wDVt5xfcTceMqtRbATFoqBUZCffu3OJxEujU97WRfQKeAkEZOZFaTEY3x4RLWO90PpcMI4/Y
 VEHYrMqX208zohxsI9WQtLLNoTDx8tGUQyRH01OleIH0KzLnkHC3ExbssW5M3t39g5GFqWPhKLK
 6BuncfOl0ib533g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: lRwP3_YC15m9zWMrmL_eRDUcy7_XHEE-
X-Proofpoint-ORIG-GUID: lRwP3_YC15m9zWMrmL_eRDUcy7_XHEE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfX4Ocp0Ah9PQhJ
 OD6AmIW4oPI6MgLUAbbQY2iyABr7RM+eG/zNVfBsLqTJZbxEoM4Hh/86jt3WqTuxgh3En6QOD+P
 Uyf3/Qdg5wI49mVruP3O6oJ34JYrqpwVr0yX4vpcn5DHPDBA/LUwVnHE7rskt8V6i2eAAqOs8w2
 l3yhaEBucl0MAeS6PMp/7QwD62NbDgFt9JCaXfzhx92GdKf48sZLq01hC1xpUml5yYVcbtJdpHn
 SARbFjy2/zLpfJa601QEYH3qmw17bFgwoC4tAuptbl3qaoxZx/Dku6Eckt3eij6A8QfDh9bX51R
 RV0Otr7EnRVylTjt6w7Qyox1V8458fYKByMS36oXxCT6wx3gYcLmAfzxFtHxAwQ8DHrfJrEUlV0
 +IVAvhhFahtl8yDfNICrLikSXlhrlGenS57kkKVJyybZ2BMIUAaF44/3rhrHAyrVRor8t5fuoAi
 bWPOcdoWnwNu7vL4hWw==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aeb848 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q0q0LOKJFIdqpUU2TdAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090111
X-Rspamd-Queue-Id: 55828238A15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-96249-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It has been concluded off-list that the controller needs to scale the RPMh
CX power domain, otherwise some of the subsystems might crash or be
unstable. So adding the RPMh CX power domain to the controller will result
in all GDSCs being parented by CX. This way, the vote from the consumers
of each GDSC will trickle all the way to CX.

So since there is a power domain attached to the controller, enable
runtime PM.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..7cb5076a460f 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8578,6 +8578,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
 	.gdscs = gcc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_glymur_driver_data,
 };
 

-- 
2.48.1


