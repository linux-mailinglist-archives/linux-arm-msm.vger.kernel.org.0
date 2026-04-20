Return-Path: <linux-arm-msm+bounces-103684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEHiDqja5WlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:50:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B6427E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 286CB3015A5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2996377553;
	Mon, 20 Apr 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpsOZGFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGhrU5DN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960AB296BC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671392; cv=none; b=GrkQ/XUiPTvkz4e/lXu3HoZZYPScTgWz86vCOvYZpgb2rrymQQCbTI8WLrRcQ+Rx0iIVe2+qetD9tlDpSipTEczrBKEuOTf9eoFIswa/eJorExAPokvqpVBHZ7BRc4P5XDaDjjJoiB26maCkLCPDxvPAimelGMfxz0VFMMZtxj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671392; c=relaxed/simple;
	bh=qPD6IW2ggKwlm1Ylhr+PVYU318puje6bPZN0Tg3JpUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSkFLIu7lNoPIdI/22wz+HXWOxe9rPfQIX06ZAtr/gYQcMWdChFo1ouCMypo8RuTggXJRhXlHrV3lQM4Au0jANIzOFR3SeZJqyGIxsweyv50liMN6GkbS0cktIp21NoWtviW6ECSYMVsz6/nhFB38Y4WtB07OQUkrLbhasXTcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpsOZGFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGhrU5DN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7WtHZ1532168
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=juMOu1sYmAvJBqqpvTr4V7omJWJEUlpkuYh
	aSUL9X8w=; b=fpsOZGFnaxKdl9+H4nGiabLAiwHA0q1O9f6Eo02FdUEr4O3FBBy
	fapJ2OVdkhasT14OgBEjLGW1+qKnlfXY0oaoRlhGfoAOIUDFZa0ggCwjpih6R3Vm
	qH8vb2GG+FDdzz3xOypUGs/nZ5YCWB9gspmx25Zzn3xCZ6sGzqKiSBMGSLVKamn8
	BrY89mXlDBRETBz6hzlh70PTDqupzVOZ3vjC/hyRqny4+7Jw7i3mcv1ev+IEjBQ4
	AwADV6eUWUfiTijb7yeATD7QrEPVgmhZkyAjNuy+paFJI25sHArdxrmtr8/79AuU
	+3ZNaVtV8F1Dsiq8yjXgc5m19oTv5cGkVsA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus05ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:49:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so2915354eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776671390; x=1777276190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juMOu1sYmAvJBqqpvTr4V7omJWJEUlpkuYhaSUL9X8w=;
        b=XGhrU5DNt/YT/gSvkfON+VVl+5Ix8Gfc4Di+2ou38G0A84CljSxG9B+1LQAKK6ynPe
         Xw/fhywPd82uvsjCVDy66x76bDY+/rSvw/N+HxpfL38HWH1qxJIlRgIXg5PSFdr4ePhu
         QtSGkrRTakMud+Zk3l68j9nGrNQHc4zSmBYlUzJxzkTqIHr4rUOy9cQ1tCLGG5vzLLdC
         kRKbveA36MGAK3uKeSwTYdB01zUME0qMfRWia3bwaIPtpyB0ZnJlKPkwVZ/38twugD+3
         1uC+NnqyTNWIKhtbgMYS2qI3Znpn6zqEl9wQvPjbIinUKHU7q9jBZr8YiNu4nUZl1Yag
         wfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671390; x=1777276190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juMOu1sYmAvJBqqpvTr4V7omJWJEUlpkuYhaSUL9X8w=;
        b=e+UPUbG4jdgbVDgcL5mPetIHIRA4sMvRltPuS+ueeNcpTjmnqOMN3cCQA6Zsf9WXMK
         531jsJJqExEy+JxxsBKSpzVugKPhphC7+xRC94pjwOkaJd2/p2ZQ8XS9LW5GLS4iuUkJ
         fRVk6p+DeENumNgPbaw5FlC6dPKhmy3n3ZenFn7Vx3GApoGjqxeq5t4BHmGoNfbfTjZs
         G6a6MccPTPvdg978ST0GZClrAejqfspo0o/ZWB4AMCooaUXY5ZG7USEkJJwSakhWCUyJ
         zOR/VUhWvvfoV9PdVCjXXuc049PvmiAe6lp3Lr1ZXm+Uv2IS6Lbsqs4gPpIMt8shy7VI
         5E4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8HhA6qtPbPMcdgosD/PeJg1cJSroT+EskebD8coMv07pGJxG+31hKTYQ188VZtIUT5t2+uVQ77oOi2amm+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6SusVSobU9xxYLmt3CNwi6BfINQkvxF886RTXNTRHTCoe+/LX
	Kzqhc6kVPuFI/q8ePMdiQmEiZFcN6H/bpD62BOswYfp96FXRpt85RQ/ZRsA+BjrZVW3mtISV1QO
	DJV6V7N5va/L6JRaj3+S1OU/dhtYupsUR3AXyDEPqNvUP7c07V/zf1nC/f0C5jVfgI5Sx
X-Gm-Gg: AeBDiet9Uug3TevjXt6dnq3rbYYxXh04yCNGqZbqsmP3NfNmW9D1fLfICesNcoOQC9a
	1VfCIAB18M9WcYDfECZrXyPtF827cUj7y4INfAEB9IdHpYsFXOdFcJvpq1GYBxkbYobzjcjaPeY
	mUfr7gdYMrYXex9jxpqSmrW4hTbbAeBgPxyu1Wb6tgWIA2ITwICfpRRoJhe11zt83CNtz0AcGpz
	iBP0eVFKo4Csm3Uyl4m+J6l1L8eT092YL6cWoUcRKsAt5/AK0jYnKlNK96QGeIcZ8kliOqRnJCJ
	f3vzthgqOdxkXq8WJxrBwN/8hoHbbaBv1e3iy7tGo4U2IENoSHg62TBWgrm8hgx2cyFqUbG8FW6
	XzjALTUeWDBTSpnwZC1DBvRrlQT5tEbV/Ma5zuHRNQyI/1UpMsIq62wKCPNdJSO9GJ1CGafOkNo
	QbURsHEegmNRF/509k
X-Received: by 2002:a05:7300:d70d:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2e4646cca96mr6994781eec.1.1776671389958;
        Mon, 20 Apr 2026 00:49:49 -0700 (PDT)
X-Received: by 2002:a05:7300:d70d:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2e4646cca96mr6994753eec.1.1776671389362;
        Mon, 20 Apr 2026 00:49:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8aed43sm13181768eec.26.2026.04.20.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:49:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
Date: Mon, 20 Apr 2026 15:49:41 +0800
Message-ID: <20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NSBTYWx0ZWRfX0KJACIg+650G
 UVb/kqI9f+sex7/zbbUT2dPT7nB5HxmOT0RAIUbz7zMoKvEADrM0n97qrzvwzvhh/Na/gLbmHpF
 lyDJZsjhiJn8WYBa2MqCWy/2WGRhjz4jJ0bCPGvr5TvKV/w/59y6ndLefu7i42zXQqu92mYe/NH
 r0TniUF5tktFQY0iyk1Bvli65PWfIsWX4mLl/6jwpH3YNMX49qaRYznRLp2Vp9Eecs2IDv793ak
 cbs5KQ80ivNyNTCZKPUXq6W6HVgrT6A+Bk8GpJtv7QALjZtKgohtkaIJV5RaRHdIo7BBxjRmngn
 Ci5e75jDOcxWLon8VIxw4d6Lo6SpiP/qHq1MWGRtB8cqq3caivRAhDmeAJBqO60eVKNBnS0tOlU
 PrF5JTiBVFwcvmnoOKoGfd823R8xwudKjOSBUQCHR+Fv5JDBBV8/4Mh9znDz/uR/E4PLY3toxL5
 mA8wlfqIKFPo4exAJ1g==
X-Proofpoint-GUID: TglzH0q6n5FxE-jShE0HrTPnzcq5A76J
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5da9e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=i-cyXkeXePKO-ona4U0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: TglzH0q6n5FxE-jShE0HrTPnzcq5A76J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200075
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103684-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A16B6427E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for QMP UFS PHY on Qualcomm Nord SoC with a fallback
on qcom,sm8650-qmp-ufs-phy.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..cc3457d6aa3b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -36,6 +36,10 @@ properties:
           - enum:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,nord-qmp-ufs-phy
+          - const: qcom,sm8650-qmp-ufs-phy
       - enum:
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
-- 
2.43.0


