Return-Path: <linux-arm-msm+bounces-106112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNstNog0+2nfXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:31:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F884DA3A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 372AB30300F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD79943D4E1;
	Wed,  6 May 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7TqO4HM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fe4ODiZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5E44BCAE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070645; cv=none; b=J+K8jFxQH+Q5iCl1xTiT/6CNmipFV9xyVXTCITio8OqSoXClPsUGIe0UJZr7KMcIERFy58jt+ggEbrvUyfKnZiP2ECm+HLJCeK2DPhUMXIFbTgi7E9s0x4S48XY2QBOSaxuDg5vA3STWygn3RFJqZjUKjbNxgaKQeCqufNqcTf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070645; c=relaxed/simple;
	bh=Rrtvw+kW67R2A1T78txuO5p7ISqaZsQkAmL6vpKgczM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmTn3zKkhlQyA+eDv3ZAg8b4IDEhPvsRVc5ZOBuRI01Aq/Pwrbzji66ruAItP11XGlCG+xwK39nf4NhUrAV2UoTMwG01Vwv6aCauS73N751lZq7Lciv77wDn9yh10CrE94jjSTlIMFNuiKVs8rTcwgv61DaiAsoxXnjzB5cXO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7TqO4HM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fe4ODiZq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467KZZE529417
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 12:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxQRGEWo0dzgEbukWTqER7zwDQZ8gVNu1bRE8lEk3E0=; b=l7TqO4HMagV+0Xm2
	OthmXXxQy36EdsuwQUIqDiY8ebeVgvSe4ajeejRjx6+MODfU5JwltKhQ9VqRIJ1Q
	k8Zkjqkj0ZmJIRVUYV15JhPbd26GDmIMRskNumEeC7GxPz4NnK7W2FiXjcWpKVXo
	M+YSL9JyezlIw0PaoaZawAlkZO8hgeZq1UO+BR8SL2Td920kEca9u64dXsLQRA+5
	okkWkuStWq3mG9Og4dUN55S5qHO7KMtNm/uNAfiTDRp/m8fzH8rHs+GQX7Xd3MF6
	LC0Va3pdoSBh1RHY7FpsSqD1oH1lyv+bKVug4UXndsSj4idq/4Aeq2f8t2YX/DkS
	EsHh+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015x96jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 12:30:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso28254731cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778070643; x=1778675443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxQRGEWo0dzgEbukWTqER7zwDQZ8gVNu1bRE8lEk3E0=;
        b=Fe4ODiZqV1IADd4eM7CkK4oZle7+FA4H1j33nv6FRegPwk2sMLdBbLvXz1lW5/GaTC
         RHgQubGYQYci0JcXpFFXGFUyz/oGBEFv6jbgS+ZLgVJqs2MePTp17skzR03IshhjOrLZ
         Z8j4albgi3tcbwf/EvGIgssh+C61B2HogVG9Gbfieuhe59WUIW8skNGruWz+oGYzStHs
         svR0+awmdMiwPjM6vpekpzdTjpzFYcP8I8OHfsKNl/kulpvRFJf2ntH3hFpeWD+M2y7O
         EODYdXFAzyRilcq781WYqZeE2qt/KXBNJQgjjdHJt5dHXCSX3jrrcFjgY/YluAZgdPBT
         gi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070643; x=1778675443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxQRGEWo0dzgEbukWTqER7zwDQZ8gVNu1bRE8lEk3E0=;
        b=LEsLloYJu2TAxnOmsJnrzCaeEfqrrrxDStsA0Vdq5QuLR7GuDo76GJeubaDsChZmuA
         kdEY+G6lXSu2hAQJ0848DEmc7Z3UuV64IcGCFuqOrV8zxiyRXbM/ccO0R+jdPPffLZ5+
         qenL4hV5N9PXPsT5xI2f0NLaPFI/kCGa3NvmLO7LmSHi+oX9Q8dYXBKcho6Uvuk4lGup
         ckyLA8vnTBbO2vEkk2E0D56vGCLRGjRavK6x5gzhuYyvmB0s/RfgvA/AWtXSNI77VfJR
         YyjjQd82iVg/aTw+yqt+P5GcUKEctLHHspcLAvQxRDQq1aLHp7MXSrpzN6mWQIxYoh1d
         z37g==
X-Gm-Message-State: AOJu0Ywws4/LYsBscAMIr5kUMjPb6DnEVe5EFrL+C1MLGMioGy33KDoB
	qvkzkvyn8qt85llcFrylmYUgNOlA/wbvp7+45bxHcJE5JvaSuT8hey84fgzFdF46Ms2HPHcsgLl
	zQrJt7RDPGiO/vYgjMfAGo6uwyyNXxNW9SpJv0vsk4UZjl1wdsL/dRdPVIVWOjXuMb2WF
X-Gm-Gg: AeBDieuOU5RaKrZHauQqq1+u7WXujCN4EYVHF1GpZzIL2MuwEQOY1KQIx5DssnYrcQ1
	rJygMzD2MvgKjv5jQGIa3v3H/hcgF4llJYwgWZkepyL+drrVKqDCtYe5MOoFJ944/J1R7dd/YKI
	N6ohwU/XahPwkTR8BRFFLGLcw3Zn6BNyph5+5Hq/a6lpeoe0FiWmp6UHw91yyVpqWH8TBPWaV/n
	rzuHmzEQg28pRHCyx0I9wuW19lZClVCcyIN/05bZwHLX8WDI1cFOWDF1hPnAQIyFsdsBANMrVfL
	rvbNcQGEp8OzyyHlFR0N30fSPr5+Zc1DTRBeeI33c5pLivgkJbj+fKtNnJIkD0J0rO4cDRyiKXQ
	HMyHFKFhWDgTlP6f+JG15pG6PfMTB2MKAgXEO+mWYRQ/i5GDqPs8H+ig=
X-Received: by 2002:a05:622a:8d01:b0:50b:3128:9916 with SMTP id d75a77b69052e-513052a8574mr92308921cf.18.1778070642646;
        Wed, 06 May 2026 05:30:42 -0700 (PDT)
X-Received: by 2002:a05:622a:8d01:b0:50b:3128:9916 with SMTP id d75a77b69052e-513052a8574mr92308451cf.18.1778070642106;
        Wed, 06 May 2026 05:30:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm11855464f8f.23.2026.05.06.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:30:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 06 May 2026 14:30:27 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-dts-qcom-eliza-display-v3-2-9e46401f467a@oss.qualcomm.com>
References: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
In-Reply-To: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rrtvw+kW67R2A1T78txuO5p7ISqaZsQkAmL6vpKgczM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+zRpLmFxvysJK0TCHzihcvjOPFSnyfb77pdRH
 mGzfAqudJaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafs0aQAKCRDBN2bmhouD
 1930D/96gWcYboyHcVDg3kvxZXqqaxT095NP+eycD8lsPwWz8G2Qznh9i+l+2oeqXF+XkavbqWh
 0rXZjsykr1O/qM+hoy67euPcIR6DuZeWCdEZiKEgamekILV9r1SnGu6OlTb4S+DhdqMgnrN+Hvu
 gvmQCYb9D7G+5R6qqyAbfPe6KCbR3mKXN1Rtc7bNOa6DTZciZdrJo4o1D/OTg5Kws9UMzziXxIB
 aeT4CRYqKb4R/mwTs/hOvV0znOG0cQFuYbQboY4nSaCYIZ2HfKrwkH0nYy/UtJQfduQfXRkuaUx
 hv3pBNTt0ftxZ2liBOEZtLEkbl8IHBvrIOuc14NzcehqFLyGQb5z8eGWfB3Uu+Ktc8/MeFmLgxy
 x8uPkC6gTrFadCHeFhNsUWZw7+4I5XFBTpxV6iXD56QNfI3SlLcRrNZ5F+WUKraRWrYDkixWfmf
 nYlmasl7Sx7LZJdyKFs87dVrhE8ZIcr7SOW7aR6wSbbKyhldQ8KtepXwHe7YMGmTaymn6XzoN+K
 TKftElE2sBuSHx2T3mGVdm38eFjpfiHkLQ9PlXU6QaVLgBA4ce/tRxmdMIUyhLlcXI92uruT5LH
 YTgGv/wMGA/eqrPn7gg1KaRLNB6A6GzOu6qcL4KlsL06zOITacYbtrphAUeZDDOR0yKd5JzaV+e
 +DKbMhuoMLvGEhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb3473 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZUgq2thi0mYO4pbLlacA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ozK9xS26lPcDoXkTcOelbbiCgyljcBJU
X-Proofpoint-ORIG-GUID: ozK9xS26lPcDoXkTcOelbbiCgyljcBJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyMyBTYWx0ZWRfX+pZfA83moltF
 5dlbksFNepz5oGwxnNbncK10wmNR9EOUjnLEeVBmASeH8Pjn/1CSYqmjZE2wHXoqHT4Elu3spLN
 KPpd2DG6fcGUmSVuCZxe2vnhpjCRD2GF3FOW2/nMlVaiUHbIROfmH+zoGY4mBYZna45VR8vtRZr
 ri1mF35RTPaSenKBYr/78meGF5WXUkJ7Dtp6HusTC5MEdorzQSay4uIB8be6Pg0rDzeVOWwUg3B
 aQA8DjsEL4lgCDWJFA2evFGsalqFR5iZ69MWSVEbQCIuLXLMsAhZZlJsBi/js6BPa6+p4gczNLl
 Nul/6LBphss4R3+9h7zDLoZrc/oWfKXUWIHcxyXXcjmTS5JIY/moX1D7Uv3p8FTVYO+Siu6sBwA
 OiMqZYQ/EJxG7pRnFN+QlxQCXHTPyK5iut+//b8rYfbCsP4a+VCjHn/F6qT9g/cSPUKutOui3lf
 l8jGMm29UEglLtK1tWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060123
X-Rspamd-Queue-Id: 53F884DA3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-106112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.591];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable display on Eliza MTP board with Visionox VTDR6130 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 3e41c95edb28..f0a390107d5d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,48 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vdd-supply = <&vreg_l1g>;
+		vddio-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;
@@ -433,6 +475,27 @@ &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
 			       <118 1>;  /* NFC Secure I/O */
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {

-- 
2.51.0


