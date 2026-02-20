Return-Path: <linux-arm-msm+bounces-93451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKQjNE/+l2lN/AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:25:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173D164F4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD9E3301E946
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AA23164DC;
	Fri, 20 Feb 2026 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gjvmrz98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRcRdzZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD6302147
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568716; cv=none; b=uq4HrctKANtATCEVXReyJbfcQ5F1TQ0NGujlhwKYhnapX42dL4UfujHecQ6v0H2raot9Q91ucBRKf2jiuObOJVgWqqgilxUM01FovwrRUf7avxW7bl2YSRwSyZD3VemptKeJsVh9yJmJe/al0WoHrwVZ6o0Bjp8PoJVpgaKzWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568716; c=relaxed/simple;
	bh=MXme44asoJj8Wdknyqe6fLhX8XbN8kYaABdfiiESoI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Az4awbs7/+4Las+Zov/bSyftYzLSCd1IX42kbZNATc6oPtIYwVAMh+kN+1+5wJb+fRzZQesTHg1Z/Qf9fy5lw2RFJt4iFIyByPrb6jWMtudors05G72SUr5VxgODVT/0EojEOTTMGEgFSD7gMsvExPFfSdwhdf6gIlmMn9jaZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gjvmrz98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRcRdzZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RlNa2506119
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WG9J1AbmqTPBO73IfgwhHp
	YkDs4pquwTzlPYhMnuoIc=; b=Gjvmrz98jmvzFq2sxfF8RD4fHwuUfzEoQf2sSd
	PLUny/wb748mNldh3xVOiP/PT9PrR137aOs+kpRpTlg96vpY3VcqTC8YG8ICeY3t
	fef7NCP1Gvmizol7kXe/6ltDOX5/Jzj/6YgZ3ZFbY4plCmL3Dm3j70rsZPZAR2kz
	RqDXeaQtJW5QlitOUsaLjsKoiGM/0rhpLzuIW7i69c3IhTtKFONAm3Pwfe5uiSFO
	FLZ4by3szkQfTRhwANf96BXyywDRxmt4z6fkAtmzwkEJWoNjKechtfzPrjUsPSux
	mcDyFNGBqfx8CleK5/E1VH7dKzeG7iO1PgdRIChHmSMpaJuQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cee2s8mqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:25:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e1919fb7bso1123539a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 22:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771568714; x=1772173514; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WG9J1AbmqTPBO73IfgwhHpYkDs4pquwTzlPYhMnuoIc=;
        b=QRcRdzZVyJqabXgf8du/kmo0Rfn0erQi5BCGuXanBIMjNIxBmgr+lJV+sbJKl1XDOY
         0h85sa8bb1PbdDeEZ+k7ZXZaEAeEyMtHPQfO1UNwgXH8B3VvDvkPRJgmoxgm4CvhBhVS
         BoihZUk4bzvduNRSKyCssjsuaRKD1px9P1qP+xgJoVCChRiXWaRMsqB4MScGfD+ATYqG
         4hkS6DtVM1wqcFh2u3CB315JlFW9CmNJV5jUSQjgazWv424QE6aStDtY89QssJ/r9i5F
         ZruqwXFhxaO2l4RPyVLDJrn/u5YnwdtRQNyCYKbTSO5ztcPdGKPOiNhukq1cIEemkw9V
         tWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771568714; x=1772173514;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG9J1AbmqTPBO73IfgwhHpYkDs4pquwTzlPYhMnuoIc=;
        b=ERZAGoEUUIPaREq2A+OPsZrXugGqtxxlDhntTUhtGuHZobWyTaeYZbREzZiPIDSYWZ
         PTq22CRaYug5KblxpW1/aEyYFqSm8lwVME/FFNLdjMkNmMcEFe5xF2xk624mB8HoI57z
         ZC9x8EnGDHdrMfANyoTskwCRd9J7mMF4EFZtDcaQJ7ztlIibDrKaryji5oC9fQ6sOQJN
         gfDDl2dsCjLht196nTZDBIg4X8vpfdF/ArJkR3KhB4aSpIvlZ5I7AVXPv5Xwl6/kF2z0
         xT9pUB9MfEdfPKE/bw06PFlIWmjRTzBx80VAmmRNzlRVNGtXYLW2Y0U1pMO2gzH8JGsr
         9PpA==
X-Forwarded-Encrypted: i=1; AJvYcCXdwCU/QN6Qy0l5uP17E1udvB4wnyHH/YKJpJ0NYvZo8WT0eKfgRFCX7ZFRO2Sl3wEIQbaGcybi/G++pWvb@vger.kernel.org
X-Gm-Message-State: AOJu0YydeodABnCZu6rBHs2z771C9vC/NZvEHDL0/cuNdg59jY1ll7bI
	sSS1EuJqX1MDAVIDNFlsa4CzDgoUjqDc3yF6igDSsdTwy9xYYLDMRhGKsy5ornACMFdVOcwAxXy
	Nl1j7l5t32VuiTlWbHfeas7+emtrECtShqlZq253wkwuKgyn1YeiQXWP7Fu3JwIVhyiwO
X-Gm-Gg: AZuq6aKqDMQZdttTQPzpU3wZLpLFLApLYLWtgcoA4Ypie61bBExhcV/vR6aYFQ3wfBh
	Yg5RBd6h2IxMtF/l44KJ9smMysiH9HMQo4S3KBxoy+br986T63oNxDkRbZbahH+J97e4n+/H0ei
	yMYVnWg50WkDIg1Ytortr93F6xwbzEjnoIjeBodjiEh9uNchnX4VLSvkFT8Xequy7xps4pXpwRT
	++weTGwzgE1DntcqlmAMY4fMh0wGYj8SqQw0kTGxXU29LycBmf9mBGfY+nXQef6Awjg9HcMYqO5
	4SIJoGMQLqfG85EOg2yktPFgQL7Z2fSdt9Xyo0cBI7pQVCVztF1l+iYIb5klD4WRuNQnqlqGsjL
	wj1H58FxD6bSAS/mG7ptpjmzib1VFkTjw9KSuImiVP8t0/g==
X-Received: by 2002:a05:6a00:c94:b0:821:80d7:2ef6 with SMTP id d2e1a72fcca58-826d0921f76mr600832b3a.42.1771568713717;
        Thu, 19 Feb 2026 22:25:13 -0800 (PST)
X-Received: by 2002:a05:6a00:c94:b0:821:80d7:2ef6 with SMTP id d2e1a72fcca58-826d0921f76mr600810b3a.42.1771568713205;
        Thu, 19 Feb 2026 22:25:13 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a29ee5sm28801440b3a.7.2026.02.19.22.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 22:25:12 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:55:08 +0530
Subject: [PATCH] arm64: defconfig: Enable SM8750 clock controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-sm8750_defconfig_cc-v1-1-666aa922b392@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEP+l2kC/z2N7YrCMBREX6Xkt5Hk5tMiy76HSMne3NSAbbWxR
 RDffaMu+2fgDMyZBys0ZyqsbR5spjWXPI0V5KZheApjTzzHygwEWAEgeBm8M6KLlHAaU+47RG7
 IgvMxAJjE6vIyU8r3t/Vw/PBM16XKb5+SDVRKeMvbZv/v7i8LYvf3sAJfFRfcotHCG6tR4fdUy
 va6hDNOw7Ct8fW6+wmF+KvJt7bReuchKgOolLMOo49yl7zQmhxJaWUw3qXk2PH5/AU0LAlA/gA
 AAA==
X-Change-ID: 20260220-sm8750_defconfig_cc-5e6278da225f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: VT2rohbEgVf1bo1rJ0LswwSlW0ECFYi1
X-Proofpoint-GUID: VT2rohbEgVf1bo1rJ0LswwSlW0ECFYi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1NCBTYWx0ZWRfX9BqNkWLN8xmx
 tDLPX7o7XvGAfTBPSOoUvm8IVaj5uUVqLbHcyt/eh0SUp8GvuE1jgzRh2J+10/zre0FTQuggPuA
 TtHuvVthqD8GWjZmCFx1YFkKViO4NNJoTtYHzmPf7OtL58IYddVT0JTyM+NoU9u5g3JBtI0KgD7
 ++nwChEPY8uyTDtpOsexFg52b81wrb81EqcaMpnsqeuh4+S67mbh0B1s5siJkT1xk9a+9KHmWyB
 cp+CAqDslqtC7yl2xR0ZG/qxjw9Q+7G7Crgm/nASJ3V66eWmUGIguBQQ6MYmDHslerjMxwZsKvz
 PNUb6UcpmaWD9eMPxgnICZ0eso1WpZMP0UIsVZdbOsa/1nWW/SAd2rcUeogQNRdubUPBsbPewza
 We8iXrvBHqzBtzCmikgEy+Uj4zBhH/njmx0tu7QQDsluUFR0YSe3Sr8Q5FfyE5BThlP+hTBM20K
 N8M9fIJEfhprS4OhMmA==
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=6997fe4a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=RkN3B2OxfLD-u3bk-OgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93451-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3173D164F4B
X-Rspamd-Action: no action

Enable the SM8750 video, camera and gpu clock controller for their
respective functionalities on the Qualcomm SM8750 MTP boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b03aab531bc1313a54103acd43b7a..cbadb217431d978e2eaff695875a9153f600ad72 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1525,6 +1525,7 @@ CONFIG_SM_CAMCC_MILOS=m
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_CAMCC_8550=m
 CONFIG_SM_CAMCC_8650=m
+CONFIG_SM_CAMCC_8750=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_6350=m
@@ -1550,6 +1551,7 @@ CONFIG_SM_GPUCC_8350=m
 CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
+CONFIG_SM_GPUCC_8750=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
@@ -1558,6 +1560,7 @@ CONFIG_SM_VIDEOCC_6350=m
 CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
+CONFIG_SM_VIDEOCC_8750=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m

---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260220-sm8750_defconfig_cc-5e6278da225f
prerequisite-message-id: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
prerequisite-patch-id: aecc008be51873da41a63b4a67ac36d678c13a0a
prerequisite-patch-id: d6ca7629ae57099cf869cdab3a216aad29f65747
prerequisite-patch-id: 24994c25af9249eac6d6fd656cca1955be66ec39

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


