Return-Path: <linux-arm-msm+bounces-97254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P2PIvXasmlMQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 067AD2745F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B83431678B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8228F3C8723;
	Thu, 12 Mar 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSJfS3z1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sw3AjJCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52F3C7E1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328476; cv=none; b=TVSrxoNi0f+FPt4V5YmNfvyZBLGU4OK1LAI29xQaEA3Viix0wbnUjFr28wvU/cY7cKKwv3u5C2TsXYixXY1znzc2PzSU9WOCgD7dEGmQOYbpro+FHVaRt5IFyt4BaYs4xufM2fLcYGUqKq3QBLMgxM9P8H0/iHS/9iml9cejlus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328476; c=relaxed/simple;
	bh=Swbs7XO5sQKOErneWVOVJFU1dqwYu2TZtbrUnvr0Jbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n994JBdbJRRkVdPZqKCP64Mmh2/HyHnfvkKnNKMIanP1Xmppem8xywuZaDcfJjPA3oDednb+/PVbeXTv0XVP8P8i2PJnku2CnBowpiXWlk6Ar8jlQfAU9+MrqbrJhzNlTEBhiVvvVmgqyGN2YGEvgSQOd3+QFSLCOYf1wqfwtX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSJfS3z1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sw3AjJCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9ltwI4025716
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9wtogtLTVQ+JC6+U/vhw/2QiP0OXfBjiSPwSkvqrpE=; b=gSJfS3z14C3MSbp4
	LZ46X2YwZ5S403gqWL9oosxdwCxKmClm2+f+hxU3xLvMr2XG6l4al0wyI2VR5H7K
	r3Y1aO2SVhnTZ9XEG58c2EC2ewc/ECU5MiW9IQLPtVNqiQ7gb4qFGR/+iPK0LXDn
	rXlxok8M7pFXBxSD2bMnH1k99k6dccAuVrtf1DEhm3ibdwgiTzZF/JSxChZzMgmu
	MefICBHiebWixAO2pSgE0xWjjwqHjkmu076qyFlIuYwfsWEQMjP7Qrll8LdQ+Ygx
	4I8wZ5Bo+El2aNqSfD/2BoB9HrrGmHvQ6Dw7MS2pYRaJRxutnc0ZQkqBOC4NnhgM
	3QtZFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50tgr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso1181392685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328473; x=1773933273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9wtogtLTVQ+JC6+U/vhw/2QiP0OXfBjiSPwSkvqrpE=;
        b=Sw3AjJCCoglQ58hQMnvyh/HWMdvanPmx+Behf15/6C5Qa8LPtUMTSGHHH2T5GxwYE5
         sDDszt+whgf6GlqmFQZKrScSjLrwBM0In9Cdl0divViPw+15cEhOALg83bqZgPyPaie0
         JGOxJdObMzmLcmwS4U/sKOSU8t5++s/iKekpQc4z9EZ/Sho+H7iyrHHFsFN//YE79Kdk
         ymlWWNGvflUenB3pSdUlEEWqF+Zo5Am/59xaC4Ol6QYFLWUu7C/mPwUQjdX3F/QIgodw
         dyvrch1mYZTg7ns3PlBkoUk7turg/hSWwsqPb5lEUpKTOz76MNQXiKJlqGGbyR3pQHX4
         fngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328473; x=1773933273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s9wtogtLTVQ+JC6+U/vhw/2QiP0OXfBjiSPwSkvqrpE=;
        b=C6RwgM6Zl6PPts6oKEStLBsOa+K8KCp66xzJMe2XyXiWn6ftvS/NPiSK62TZzxJWGH
         1yzSLrep2P2ON6odq3/Xg4lmM+v7WUBvHTkZKK99w/GdPJdm5X7ltOLj1TvkEPu8CraI
         LR5cGXhL3r1qEWtjmeeQkkqrk86FNlKpdfS2x6N38hZ2WlnETWxYwMFUUzaEww9CxTMf
         eLETk3CcVwbgAn/1vNYeGCb6UljRjPTnPKaTrjxLyNrtepSttODrvzcCF7CqbjMsMtvu
         wXCT3842280+v6Xwv1fqsO5nkW3nI0hi9Me0/P4laTn4mMknQPaq183tdmWQPPSYUEhH
         zqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr0kPTlNrZHq0therRasbHrSI2AcRDMqBe181WbTiaEyki+Wmc1H1wJso5ISngOBsZzxHvCrK08FcpW/KY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/mielope+8HyH/LoWcAcQCO6GwOM4JIgm4dC3kCMCk6DbTQ6l
	5kybK17l95jto+9LwlK0KW3xa/UGTvgfLLj38Qt0dbpJ31ht1//TiyEC0YqLXKI2mctynEstxnE
	F49COcQ39/5bwNx0OYidNMDTaOl8sg5EHdkFF/VTPOnqw6ock49RJxJTkhjrt5uKx+fAR6c90BF
	BPhwo=
X-Gm-Gg: ATEYQzw7JVSWWUVPsbW3bELqqcc+X0WMw9jkSygnI3BAHfg8x0aUu5P90vOs7oWXWJ7
	3Id2egrhXG6++vjUeYv9G6JG7NWGpLUTkxbIiQprLovPBYIHT+O0pz08JhPfSDYY4JLbiPOaCPh
	sFdvHXas9gM1/i2Ye8UhJkfnrXZB09zQaZBS3gV114u8acvphn1MAMz4kFIf0jk6SDTlVD5V1AM
	YyuMe1w1g8aA2FxZtpupTdUGBD8NZTWRB9CNdrxIbL1kBT8w3KYrM60Pe3MqZCekKYW7YCObJ0p
	tEXB3feov6Mb8FwZH6a2N/OOs0eSa8oSLkEPV9F47euAmcJF2e4m8miZ+igW4wt/4ttjfivjogi
	ypPXWbipKNo/m/te5UjeMexFimMSFUSlX/d7EbKdS/7lyp3Ra7mcXREhCErYy6oIum5Pn0bpYlS
	wcmbqLtyM/2CkE4pv2qZF4Eq9n0cHMqiDSZ4M=
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr9849485a.32.1773328472477;
        Thu, 12 Mar 2026 08:14:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr9842785a.32.1773328471822;
        Thu, 12 Mar 2026 08:14:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:24 +0200
Subject: [PATCH v4 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-3-a047ef1e3c7d@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4694;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZvJMG8Z3WvBz05XHBSniabOrPMA7K0JLnPM7q5XpTGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthQsBU9FyJ7DJq7CVgXLD8MjKKlXPb8BExBn
 OySTGKTA/qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUAAKCRCLPIo+Aiko
 1dHmB/wJAdM0B/p38JrfMglXwkVQtkmyBhIlCm4Ufv4UaYpByUFhBhT8y2bGsx3XVsrzGNqK9YI
 12YjVKm2aAeSH0iPN/vug1/1l/aTAW6eL1RWIWyjoY5+6e8AvQ46WdiqEakvbA9WnpdJaSyHfYS
 n4e+aeklAv+MvdqMcT8410ZDY133hZOlWyJe0Ljz8IK5lQsZeuz1e/a6Z/tuu2UguyVBFxYTZmf
 qdnMzBtVN4/vBfvc1UyDeudzsB+ZnvMzhFb0PE9AZcbiNbWAnOaVLrI6mcFUKnwnq7L7QJBkJff
 46LRW94uDNfPwXgWNw2FEGfzNIZQ8fFYSNseF3aX000l6zk+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _4fmKbu5RzMLQ5OxmexGkLJJNrgCiFUp
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2d85a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5etVbCIt5GNeBr577cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _4fmKbu5RzMLQ5OxmexGkLJJNrgCiFUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX0sW3yGAsFM/A
 k5geWWQwLo1JwCdLVRrl2hmA9Z26g6fuKZ1tXxBuwmPZb/uuyy91zZegITdj4ftCQcoEDEAeR/L
 jeluUJbK78sSCiwDY+edI7dbIYIvpN4o8x3QrevctmKOiyZ8ZKe8s9SaGZhmZ0UzlMn6V7hh5EB
 rAWCC3Qe1I5yD0D8ATrlTe8U2daB1Gz/x1wk52Js95pLfBzHu2efFLk68UEac2Jbn+Zwe+E0xSm
 aU0WMcLr0PXAn2u6GiX04AbBaO1gZ5NA1dgOKz9hLskHxMuUOMyqYH2taA9n3C3UWMZy92fCzds
 dbjJtPTk44a2uZe+oFikRHJncG5/pZJdISaCxZfYephknUP4mjzf115up0/NA4sv6q3YxcHvWvp
 hGxhjbgwuE80JDup5JoJlZ2YaAaL5pdRLSs0WXVn3aOldI4JtVWgzXLtsOxK6ETGmKuXVAAa48j
 pZwtqm3D77grb8NYJpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97254-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aa00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,86c00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 067AD2745F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Iris core on SC8280XP.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 41c57e7dc433..d950816a9a9e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,13 +10,16 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -691,6 +694,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>,
+					<&rpmhpd SC8280XP_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2a00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3


