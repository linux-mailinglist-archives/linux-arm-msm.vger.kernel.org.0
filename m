Return-Path: <linux-arm-msm+bounces-107299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIIyMiJ2BGqdJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:01:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403E53383E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3459830EB602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCEA477998;
	Wed, 13 May 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5HuTHAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnATUcqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41F47DD50
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676582; cv=none; b=k0oaS6kzlb4bdnyvc9kDSwHCvnCqsojRxwL0U6NaROqD9GzLksQGSpza4Z01InoHJr2//VYc1sXs/tHN6FrN69glyu/SKnE9IBSyR7LEc8DL30sExDycprVpQ14d+LnCE96rf3qMyWwln7HvaAIoUwgToFlewVlwMLl8PaEChvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676582; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKLs/tVWd6sv8HRHdzdb6HPYTXr01IogXyrSKpaoLziI45Le/3p50+1DFgrXx6IEmKNgp8t7Oim194ihKjQE8S6hPZuGR6vpNIt184D7uA7IA5ogDYfRHEzkpOEcgfrkg670Wq9yv8FhNHKRu1vKTG6rUY/0HwlcRKd62aA54wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5HuTHAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnATUcqJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAPBi72321422
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=B5HuTHAFd+YIyu/2
	QcIMHpwhtFcSt2NFbTxfnHc/zjhH5m4xeJ9qeX/hI6o6fT5GKI0I/W4Bd6Ns0Zre
	g8kSTyWSrIRwqIFhYgMHdol7tJUZDnwUU6a+hn+zu/+AeYInJds4k0zWKXlYDpTR
	sJa5xkPAJ8AwyFFikBIn8Xr8gkSDTl9IIDVPW5PtzwEOSws16mO0PokArulqM3PB
	oGJcHUrREK6qC4J8eKIFLlOhVjYgh+QIVDH1Y2D9WljEVwMWl3KRwJ9sAYhKhXIM
	wr7qntbEpeug/FUohD0wVK8nIh/qsfVZNSFhFmxE1NPKc2f8EYnMAxArVktQ824S
	62EE9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9y37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so97927661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676576; x=1779281376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=TnATUcqJWgVZMivvJ3a08H9E/Gx3J0hypFcqSEXNihUwmofehfjWP33GdZwwb6BmIS
         lrOxxhsg3UCeVQQpJcKRtQhfhmW/1mjm4S03ycWxUYDoi5pUP9Al7EEuFnB/9LCYXqun
         J5e8GE263FnZxUL0TI/ZO5wCe0Dz+XB2iOvVoaTmd6SRm3a2UqskFjyfhLDfApBNcmr8
         8u1h9CcTXgcgeIod32sfzWPCAkns/qtZ5D0E9q8MuGRsiquuLShUDnf+FLcWaUgSuhdK
         1BRByk+Ujijp6HIO5Ua8EJENEykOylDqhNoIzaufDx0c1TuHHiwpxssi6AQCOb7NixO4
         7mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676576; x=1779281376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=Aj6dq2uzJ7Aek9k9DOazGY9CVFJOngI3sluhJxcc4HyK3D3PPeUc0JDX8+4utxK8bz
         2d9yBPToy9iAOzbV04tLAGKMQcynsT5Vv6xCGADGo/o4wRBCQ2PuM/iHaRrb1J78Az20
         wT42VdCoCkY9JI0TTKzk52dZY7gtdOsQ/h5O3rZ7pquprkb1rcZ+TQ5b6/90t2NKZqaW
         8RxGDCjMSsYa/ro2HawjZPATSvb+X3wyv3r+woJpWO5gxc0YBlGJ2cveY3KuQ6+/bG6Z
         C38DviiOykq7wysHDGN3i47mDl2hzVuJJlF8L14EaVyGtDNa3NHccPeuk3LCTOLdF77k
         G/8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9SCUbzztjQ6gzVQGV9kXb1F+fkg2UCfoZbPLBsqEZOUlQ8KyKU/+YtiqtxUzU8gFTaGN/TsOUk9WS76KW8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66CuwPiCza4rx0q4UlbzG0TX2uNAb2ZS3MUXLGdxHQdeNCJIR
	tTnsa5yk3xXz9ITKOGngRciNtl70G+Pk83R7lYgC79XS4k/kPCCsaXF8RNRR9OJTVDmItgUFs4/
	YL4XALEmEaag+z73D9VoyDXo8ZNWXE1XaYIHj+eNdcL/CVq24GP4VGLjo0QxdP7Jjmw8C
X-Gm-Gg: Acq92OGrQf4tvJjWehS9IAsQmqPaad1NY+S9GvFd8POkG6N4B+Kr3+HEY6q1x/Ru2BL
	xNBOGohiKAY58emZY1PWGB2cgBcrUpOcZovcIl7JjhkG1fpfqRj+r6ZmgMpwtb0AukSWGF8pVsW
	BHA6h8Rpf5Ahb2ISfA74Xc0r2xbrd10P3cAQo5nveNufgIm9pO1LRz+LQun1vB2SOVCMbBO3dTh
	LfVnvKdyAcQuBsYZMCqaigg8i3UZ/xv1iQwRaClVXdEmCt/NytaCX9s5ISS6XSOVzqyEL3qB6p2
	UQpV+h35nlvMcvs1gZYcLbE+vhMVI8tVjMVCr/NPGtHM52aazOiUDPVf+PBKpUcVhXjoInn2lgh
	XzqpSrA2gtIaLjTHvhGKG7NwfXr37W89nheCpgcPENN/oaMevLhubyGQH0VKppwOS434VmhTE36
	puGGiZHRzzCe7lFiCopMR2ZNFPokDSDR0T98Q=
X-Received: by 2002:a05:622a:413:b0:509:5c6f:c0e with SMTP id d75a77b69052e-514cf01d4c9mr99998711cf.37.1778676571419;
        Wed, 13 May 2026 05:49:31 -0700 (PDT)
X-Received: by 2002:a05:622a:413:b0:509:5c6f:c0e with SMTP id d75a77b69052e-514cf01d4c9mr99998331cf.37.1778676570943;
        Wed, 13 May 2026 05:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:45 +0300
Subject: [PATCH v2 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-11-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNBXR5BkkB34CVfSLNuImHH7Gy/ZgmIB/A8H
 EIAocIhG/OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQQAKCRCLPIo+Aiko
 1XZ5B/kBwnwQjGjpk5WumUdb4z3B8ob7rKlTIhOjuIigeerdT+MKXIF/ADFCQDfGarAhwUQ1tSt
 21vUUPST1hTfTN/zFv72tNxdKI/t1lKJw/Frkmh9hdRW2jbfx39ekYWUeNiAJyxjqo2WAftdnf5
 +IfABkfLKlBmH+ZTEg7OE5T1Dci2jGNinqutNTpRrt/VUGOpr1GPtxZn4MPXzl82VTO0s2HeeEl
 EPkwuSIVxZIb+yf9lzwsITEd0hyK9rjLPVqI6S7ZBQ/mo4vVn4wqogYpSy96Ah/bDpc3yNkspL2
 asuKRWupWK5P+pVSYA/4XD7Tdqj3kZ5qhlZS1+KGnsrLCK8j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a047361 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EfFZhikVF_HaWHPJFnY4f7P-JS6HuFyU
X-Proofpoint-ORIG-GUID: EfFZhikVF_HaWHPJFnY4f7P-JS6HuFyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX9RLkXhuqcI39
 i+/ORKxDqa88npQIWSTYnlo6aKbwFIqww1LmMZDO0eZ2obmmUtwhqZsJNES1IUFKGgmT5qBrPP3
 nDK46oyiZkHCxej3IliwCMceueTMF5xCWt/Y09ZkIhNLUeS7yCC2n4YaXRtFgTz/J3j48JVJ+CH
 jn15/E9RSjj5D9J3+SV+f6syghhgJw52R2xDIOnDrOoFMbZnUJ50RxR1hLZ0nxJJOOe/XUrhif5
 iL1L4CBCmDkRP11XMj/2Tx0+72PV7RHh8eKF8ZujvfvQdva6q3zObi38hp1sjB8MvCgtBXpBptW
 iHqtBay+kuCSEho0pZoDg1A9gw7FbZ70Dt2PHEa+r4oJ6LbUdRWjhAWkEU7U/JDrKGlbxkOgHPV
 UUpVNRqrNtH4kmS5c44aQ/HthoVbzRmRWc7AIlUc9rTlEcoE327KaAWKMN3K15zrYVtnClFXNmA
 DotSaaCalzUc8NnMBRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: 7403E53383E
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107299-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


