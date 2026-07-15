Return-Path: <linux-arm-msm+bounces-119261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ypB8H+iNV2pYWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:40:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E875ECCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lh6KJjCH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EcscOQfj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D4A3302BA7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5C144C644;
	Wed, 15 Jul 2026 13:29:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED3544C67D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122176; cv=none; b=SSHN/tOJOkdTBpfAL3N/O0kqpPnSCBK/uzbBPZ2pHeTd8+CedyzBwzjWnJBan6ZHswLxzPlAbl7vAnscv82/apwTjULDFQDhX6mkvuH3J/Yoyp9GmVNcqsMdgsGIq/e/VZizl+pD/TnD9kUmVMM+pN+co0Vrkx12Lz8/OoX3SHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122176; c=relaxed/simple;
	bh=g51DNByPJDCslSrF4VLLAsFcqJhhSDHh0rVJN3NnYWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XHUkQgYws7LnU8APwWxE1yBswo8ITuAL5RF64py1RFGsNRI+M+L3o9M/ED/7OCCWugSJ3Afbm+3zUyexqyKCSQTEXtV7nkWbWv3WRSFjLIWWY5q0T8gmh1lq3cxarDUuSmJl66H3St/gNzVhU5kIHdB/BQM4J10AC7O2cuQXklc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lh6KJjCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcscOQfj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcluM3707721
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=02eLxySZVsV/sAQlk5L38k
	1o7hCjMOgu8dVOxM0R+Uo=; b=Lh6KJjCH1MoWYVQ6+sN+PUaOhL1iLHYNvzulcT
	1CXYjqk4dCGhaO/013edEuilEHzKHtEXLiFYxaMoMCkQFbhggKTXeEEEovHA4y1H
	kheFu+olat44DvrON7yf7VHJXSMzWcwakmdzqOLWIUxoqljEpCVzLEN/HlTsxr7h
	cSsCZWMHMh0x4FJJkQhCAR7JqBwr5zhocJhIwd5nkAWRoj/NIAH8NEfLGFGrSTLt
	J2HNzHulTQeIBewrUAOAUp9f+UyVSs/zXO4fufVk8XzyVbAmlxt+cuZk/eagfE0V
	iWi3OUupLJMv+DvR7e/Oe12PCD3QEp09zL+Gzzl9ACjnoaEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgvp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517e054fe07so111344901cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122172; x=1784726972; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=02eLxySZVsV/sAQlk5L38k1o7hCjMOgu8dVOxM0R+Uo=;
        b=EcscOQfjl4XaPvLTauIxrcKw3yRHZ+C6qgTINQWNrNTmg4iR/QXLSmInQuC/S1D8En
         v4PkY6BPG3JA51OHXc6h9H9p7HFts6ze4XSmb27VAElhrrivHtN0S/lMtY6jGqY7egPw
         x392LkZlOTsB/zVscVAu7UE/PMFY0/oQCAJs3dnuIOoq+hqA0+3ovB9xno2S9/DyK6kO
         Q+JBPMDU5PdTU6D5JZFjuTVY401KZdpEwO4J8iYqdX/jxzJYuFmqNqrH28iNm8Ayh493
         +2pZjrYn8EShJG7qu3UW+gGWc8mx+C6Rr0QXKFAKu6YqGmhLxCl37hI4iiOmT+dHUHkt
         xU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122172; x=1784726972;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=02eLxySZVsV/sAQlk5L38k1o7hCjMOgu8dVOxM0R+Uo=;
        b=nT+APG1Btha3OKoIAlOLoo0C+AZadAuo8E0Rfzm4q9efSz5xh6M8DJcF38/InXvL/l
         B1Byc4YV/NcN6r5H1l1CCBURSNqOXWPJYqXwPbIVoouyyXZgeRU9qGVGDB5hF7zaOMMQ
         L/ZqAL40CRkr4j47xXeGyUEA13R9y0q19Nz83I0tpiBoTYtfxuaLgSGh1ATmlHRBcA3q
         OtJqZ7uUAng7Mx7SVQzv4P6lRHDxL4b9ROE2gARjO028uUceSC9RrsZB8GKwgVc3kgT9
         8hm/gjf1ubcufY42gX2QY0M8Dj8wnCmyIjK1ikehVj5pSyaGpWNIUW5ObPDtXUyfhYxM
         lkwA==
X-Forwarded-Encrypted: i=1; AHgh+RqoP+Vl6qsU1IqFqKQvMbLaL7BqDSpvPQbubyd29WuDU3W0G2bVho+uqTFIuDHewqWt7WWxrxOfC08Yn86O@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8URHGPK70imVaI3NX8vfA3R7NoXegeTW5psG/KhkCSychGpO
	MJkSFb85f4aY92gN718BzK9hxcVgXy3ZpTK4NykerMdz5gHGNg/C2FpodaiKULE0XvHIgvDeoEK
	pEe95V7hWaZLKZApa/Pzl4+B9y3VLG1w5Bed8bccXasmel7alpEkGCTj0DRFf9uJthURy
X-Gm-Gg: AfdE7cmcLBQhOlpFvEfHupL/WEoxO8hQ9P+XEpmLabF/T2jTCuCwlyLp55YRmS1Raym
	xsi20D43aVk5OTYL+mFO+VPfDsqyZvSpZNg/xaJ3cOjLegawGdYr7DVKJVBx9d6m/gugWMMTCDn
	WGiPi7mi0FSsCA6U5bY5nSjZm8YPZ6DFJpkWFaPJ1rEtenkV/bnzZqlKHwev1qF0/7RxS80eJZG
	3Kz09UUUPEILzW4EPACI51RF5DsL+isw+ARclVDPA/MkhFdg5/8LyhWzj0FzL2kIV5MM+EGwIGs
	JDktzxhcswXVsvoDV41wXp6sc+/QScswkznumjGokAhkFO7ZaeRwt1tFJpQhvZgSYl441zTHfbB
	kZJaLCFTehMGcgBk=
X-Received: by 2002:ac8:7f41:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51e4f0b7865mr28045241cf.47.1784122171885;
        Wed, 15 Jul 2026 06:29:31 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51e4f0b7865mr28044411cf.47.1784122170905;
        Wed, 15 Jul 2026 06:29:30 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Date: Wed, 15 Jul 2026 16:29:13 +0300
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACmLV2oC/42NzQ6DIBAGX8Vw7hrA+tdT36PpAVdAGpUW1GiM7
 1601x68bDLJtzMr8dIZ6cktWomTk/HG9gGSS0SwEb2WYOrAhFOe0YSWoNulGx0oM4NGBJzBo2h
 Nr0HQKkkp1ml+ZST8v50Mq8P9eP7Yj9VL4rAL90Vj/GDdcsQntu/OdCYGFFRWcCy4YixTd+t9/
 BlFi7br4nDInpv4aSEPwjoXaSGoKCVWf4Tbtn0Bb5CuyCwBAAA=
X-Change-ID: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
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
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=g51DNByPJDCslSrF4VLLAsFcqJhhSDHh0rVJN3NnYWw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4stYxKuFPiSSP/HYnS//CJMyK9dZJx8MFr62
 6DCLD2mMgWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLLQAKCRAbX0TJAJUV
 Vi2PEACu1AuKMPneLdVywQiS55zy+eI6ETAP2ArJjlpYoGpvHD8j1a951UJfSh5BIXr2EzKagvg
 nIfFXEnfuOL8h0DKvqStynVMLhglng/Kq8EoNxllk6fQyhR++/DySsc/DuNgjdmjd6yrrDXp/mF
 u9kcdyAPa4gmQzBSMLxiBMyfx1fOBr1/0miRQN3KSc/jdsOkTcaa/UzDqpfjDWptVG0NebzFCR1
 OrcdZEfePu0dDx+ehdm0VNFFOkVMIXspftFSO0Ce+Xhxu6iittkSWLKo7PpZIutpE168bZyi4bo
 8tJthzkktkulfoQMPqIw87rmxfL4EIfpSQe1Z6XWkp2uhjnhw7x7zzecLorFkQFn9+W//ZuV14u
 KQm8+6h3buwCyHd4Ib5+6jSBUV1STlbVTWrrO/Gp46oWeQ7v5mPsrW/x5oY0QceUVWzovMNUDKq
 O9RZpMaPQg6hTaqWWXk0jZBF+Ya6m4kp+2r8q9J4v+f1rXiltneNL9b8mzGN4pApZ6mRYcu6/o4
 TozVXio2OcbeN5wur+Ulx4w7WWi9FlUvSv5GoOvfZUn+zX/JwosbGSJT5XlT5lxHGg64Ia7Eg+2
 rVbjk87nl8UzDRXp/KpvMhEDvWRkNj0LV260dXEYHkaKYlublPyY4U1RwaV8r2WoczFTQsREcBa
 rFob++gEz+DEtzg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX5VOf/E5RAEVT
 jk6JbC2QWyD416n3/xRlu27LQcdO4hEqe9jgofKU+UQnUCse+TouKsbt1IuuIb7WxqvlFZIw9lt
 rR/+AP6aTzm349nqNjd6Oeut02DZEtQ=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578b3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=WYYMOgmxChqpMybUN8IA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: CeGe6NTxAhK805afzRxF5JM-OdsEE-fV
X-Proofpoint-GUID: CeGe6NTxAhK805afzRxF5JM-OdsEE-fV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX6nuOzZ+BdTWt
 Wh63n9TEbRegn7MuCAwKj1FTOJwnb6cjRnvlmccSWkoiF9o0rBhLQnKBMRp3Pyj6Dj1azb41CSE
 eduDGfl/cYKeE6ro5g/mtBKz/m0MRykkczrzyPgBEWaVe5MvF9gNSDMplsl/lSDWJNP3yyjZj//
 /1d/s36MPfqBNbxPR030E6F9IEqhVZevFaZ3maKIJqQrGSEqrxAAN1SimX+94VVKAIP32sEhmFU
 WURdg7JXmtvw8tt56fSa9eF1SV+ZtIytfiODKkN2Ph00kqHIqluJp/PgB4/03uTmpeg+Uox6FTw
 AlbmmYhVBzJ2bvpeeo9BF0KX2ic3u3Dv1vCJDOoAEvN0GFC37lyyjUMZRx+PwYNkZC05+806qre
 Xs9qNIMI/PSrvwMV0sGSQaN0PvpUhoEjNcIjTjWdX+rk5qQ8Dejd5bbDAdKh2j9XUw3RuT5QpQu
 Kw6Lm+smXK6tQC9CSfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,msgid.link:url];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:maulik.shah@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bmasney@redhat.com,m:krzk@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:abelvesa@kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 701E875ECCF
X-Rspamd-Action: no action

The suggestion of having the CX power domain tied up to the GCC
controller started here:

https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/

and then, for Glymur, it has been brought up here as well:

https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/

These plus a discussion off-list led to this patchset being done.

Sorry for such a late respin. This got lost somehow in the need-to-respin queue.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260713.
- Did not pick Konrad's R-b tag intentionally because the commit has
  been reworded.
- Link to v2: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com

Changes in v2:
- Dropped the required-opps property from both the schema and DT node.
- Link to v1: https://patch.msgid.link/20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
      clk: qcom: gcc-glymur: Enable runtime PM
      arm64: dts: qcom: glymur: Add CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi                         | 1 +
 drivers/clk/qcom/gcc-glymur.c                                | 1 +
 3 files changed, 10 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


