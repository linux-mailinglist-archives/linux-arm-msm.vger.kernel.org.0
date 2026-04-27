Return-Path: <linux-arm-msm+bounces-104653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHMCGX8p72lE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:16:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C246FB1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3DCD3005151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6478D3B2FC8;
	Mon, 27 Apr 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWJTr3pX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kv2/O+Oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8EA3B27EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281363; cv=none; b=fu5CwetGnhxEkywy0hJu2yvXBcZxE67uPD5/rVrgo1/slD058IzlCH2LdVLyGBHhPdiS0HBENrbToYfBxuFgkx94cVe6uC35qin4pBI+7MSpReOkHhl3bpNQz/MeKUQbAiLAAmvcPMuLcsQmMaASaniv9uqynwSAGMfNF3FVHtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281363; c=relaxed/simple;
	bh=YERqA6ytYIBXeEnEVHuNkc6pRniKdplpfqUBYqgG5Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qaRq2Cktf3/9YVwQwB/lhZU4HmiMlaNrz6Goj1jYVCzpM6lYZ+FoDEvvREQxFiNUpO214jEFmOfQep/SGF4pFt1FWi7/ti3RuyYV+j8epAZBekr0mPGXaunJb3l6Hc4XMc6OmH6UVJDuecij/p8VjepbMrEs2VMp7tBpLIwi4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWJTr3pX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kv2/O+Oy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9pq1762101
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=ZWJTr3pXlqCC2RlR
	FGlJ6AX3AXqMklp6Ymy372sFwRBv6WSMo5pagYddmlAHtIDWQI75fUnBQTV9YFQN
	vdCRsvcxKfFFotp55zhr3VXiQknk8BIaAE9MdeKzGg+ZYti3R0E+Te9bKfoMuWu2
	B0HsvlVx8Nx6U/dGOKH5Z8e/nt4L7SG7XSHV2PIbr0rjfLPYEex1wl0Uia0vGPjb
	PjP2zpHcypgvJOSuF2mxKzDX4D6vydWeG08p8pwzGmtb/p85Vpg0HtcYDb/FKBQl
	Gqf1Kv+HSIqO/c8Nx1bPQl/9Bd5+2RuFz0P0mdnnuCIGA5KerLvq0hWhi1IIHGra
	XscZXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9d9yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e592e833aso113232851cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281360; x=1777886160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=kv2/O+Oyc96TKw8oVetUWHIs0jw8fGViA9VXkpiGiq+NzOfkKOEOJbmLopHRpvDxWv
         D5VBdLfnsNK63jvzHzlxgal0Xd45igA6BWR49Jb29gO6P/fgJh66m0M1ClSJ/FTTEOb5
         8vIWX2Dk9y4Phnk7Ceww8ZPNx/MSNUn+p0wbcopMw5cY80yA4ROcOZULcPpLL3OKfmRq
         1mhZdMMRxd38gxTk3aWHd+I5Lut/I3KP//kHPcSjgtrSKdURfkC1cFqH/UeV52owPM43
         els6+wEcSIb3DENf/gVrk8kzQUMM6RW7vVCsGXB/7SsYR2huHYPFQqk0V4yQJc2Y6psC
         MNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281360; x=1777886160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=Cc6LrfTP6XWvVYanFio8t+7SjVCpFR/mRE87Gcx1KTt2vPCBRMISkw+0+CFzxXvy3V
         pfDsnMGhA3UxMVrKIm96LxVVKd/TAZJPLag5lzO10mkR3/WlbhEm7d9tOiMAaDAb0crm
         BkXBj4+4rRtaeuMGncep50nsvDYw6/3Ky2GzJHhKgLwqgpBa6IUK7fEbf3o/vVIvjfBR
         HAuWQRgRdfKwf+/TiqsdnPjBBsIwEjETVf7BLT6dJmnx+3DBow8nwIO8O9p2gZTWQyHt
         BCKuBF837aNEL6ydjKc9h1XvDAl57TLWj/NHhU+80BTo++0HTtm1zsSAdGB83HxpbNKq
         d6ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oQXwekckgjRnZ4yl9QAkg2Nx/Fwk/UzkqkXO9TIkjSRDLeeCFG+O38DFD3e2HhuRjXKaSiKXbIHnC+CzJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFg0YtJt99SUWwwjiQgqHRFe0PusdAM3Oms0FDLY19cr2sEP+h
	HAWZgtFNG/RvgILVX+yHM38ml0Tp/ajTXLkUYuHnOYyDmnST2Me814CWO4yA0pAF320OhZsl+wg
	1JkS4MTnJEBgDq4kNaBG4H27I0lJjTDY9/NbkTv1mF2vi/pPR+WuDtOWhnNSkCd4joLik
X-Gm-Gg: AeBDieuA3H23usVCvm9q5bYPG8hdKxFxTv9M+zxfA54Lf+zurUSbQaL8XRrFa2RMnwy
	6/R6lbddkC13hx43ZruW/QDYza6w4pPKqrR+dTEITBNqbdgEVqamy+NgXoykb+5pMEYYAPxYl97
	dusiq+wPYncpcwNSch6KGUvp6gBQFOh3CdTHgzd2lb2DlfoQ0Q6yRiSLH0rrUJ6IJ4NLs2h4bNW
	g8TyMadXVl62uM7C1iYN/Botw8KAl4LlWuxr5Z5veMOA0wpsdMfG57xZ8didgGEDCL9hLUuOf1M
	iCe095aaZmNuzPSbJf7iJI15LWHX4PVW+rxrZiL/oLq8212x3LRVv+Aopl1X9HkWayDarMEi7fC
	b3b0EwlXw6rfp5ySJcSu2sgy3yWtatYiweyaFYNwG6xL5LqvD9iqoQu3J1YHw7w==
X-Received: by 2002:a05:622a:590f:b0:50f:c2f8:406f with SMTP id d75a77b69052e-50fc2f847cfmr313194481cf.25.1777281360085;
        Mon, 27 Apr 2026 02:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:50f:c2f8:406f with SMTP id d75a77b69052e-50fc2f847cfmr313193951cf.25.1777281359494;
        Mon, 27 Apr 2026 02:15:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:15:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:35 +0200
Subject: [PATCH v16 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-2-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YERqA6ytYIBXeEnEVHuNkc6pRniKdplpfqUBYqgG5Qg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7yk+0IR02U4vnvTl2IX14Yli5+ns+gg/PlpWP
 b+iE3z2vWOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pPgAKCRAFnS7L/zaE
 wz9YD/sEVzMrsUIG4UaK+/mt54Mp3VBFDDXVNm2K2U7sk0ppOLMYr4EutporK7oql4DcPrzFBZt
 Qk56jWtdQOpI0X/p2Z1Ppe61eX49zb8F9kDXiI0plagIc3EDjan+8SgKgoVcge0aROw9CUXl4tM
 u7sHqClBoegraSAdRDDiwFQ5BjsObELo79m0DRPET+gPZ8GcTm14Gi/6VjpQ4WK/+Tn8lL/qBGl
 cAIu2CcguniTHKWhoDiSU/PqGfcLYn5Qq9f9SpaEj7ywWy9TjyD0sZn/vfA7uhc1aavq7PloA+b
 5DNrQpskyFl9k5uRr6j4wDGvvEIgwlw5mLCrq4CvOxMdW7INCUJq9yZZ0BPteEW0DP4B2GjdsuZ
 K+AywqtlfyVNrr3H2Bo7OXyC2G91MoaGPl0YB4fODR/fQxbx2X+P2O6/4Z7eVW7saTGruN7MAR2
 paNamOud48+wEY00NhkXCBc13vGO03AuGGfrF2h946eDZn3DsES1wL9znf5CHaCAmPt1hrmSTIT
 LCkgZw3ij2COfvaA4QRIic+ovd9iN36hYLfu86L4C0ipCFJmwck4++uWzad7N65CySvLbRdMb1w
 qbUVfcb2+ovKD0nhbcSwWVHrb7M/21CbmG79mv2EkJOdQT+se+2A8hV8p7v0/2o6jeh6wkt+9p6
 6+wtVqWTC3L6smw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Yxpwxg4LOIdEv6oWvbGlO_Xd4pmCkC90
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef2951 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX57yjIOwIeIel
 PKWZEy39wfQjfaeaRgHYfHGKfy2XCCboCw4ZURtGrMLtRcX7VfP0RzeL1gmpyhWHeX9UcytRTA7
 ve5cpwml8XV0eX9lHaTSfVivXMOJz53SLDU+ItMcxVQw2MCOTGq36VnKYCEyx8BmyQafIcfyKBc
 9zJH2hJuLWhb7F0KD1jVVfQY8satZiXLEtuSZrnVTwkhGFnjn+iaTEp8aaInnDZ4XRDW1qXHS8/
 pA6CAxVwOm0YJEkL2SsAE5HA8zPC5zCxViXQdaHt5wp/WOttfqNa+SSFsYu3lLg6zvWKz68Uqaf
 RxeufRKWnbWVwCoZqKAC4WE7jpqI9g6hqauuYlGj5zN4a4fNhrSm6pV4UJjKSvtBrlsN/4NHRzw
 ioy/N3i68rw3QByVCZBfYTwuAxHkCz12XQNpemoko1UlX47JmDlHjuYugyjkq24BEy5nfvFHm+w
 IBBwj8lyrJXTyWDxlAw==
X-Proofpoint-ORIG-GUID: Yxpwxg4LOIdEv6oWvbGlO_Xd4pmCkC90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-Rspamd-Queue-Id: 609C246FB1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104653-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..c8601bac555edf1bb4384fd39cb3449ec6e86334 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1358,8 +1358,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1393,7 +1393,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


