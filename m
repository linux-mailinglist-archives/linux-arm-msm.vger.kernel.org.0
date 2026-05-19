Return-Path: <linux-arm-msm+bounces-108514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAVvIWpkDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:23:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038457F8E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 416E0306AF85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D654DBD6F;
	Tue, 19 May 2026 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHQKionV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fM4ZelIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151234041E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196693; cv=none; b=NlB1YK45drjo2uRpW/QbcVZDy5rGf0kjIcsB4x6y9OcKKJnNyX1aH/LmBXIp9+k/4A9VG3h0Q5XwJZuGHH+oHWlT0sIU1JHX+6EW+dCmtj82koVNSUMYIski3+a2fc0Tm1J3X/RiUaIVKe39lSnhyzXZf5Drzab60XNL1A3kwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196693; c=relaxed/simple;
	bh=/XdTe5MprUId+Ss8VqluKB/Ev/oJCk9nXyM0caOBB1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dKsdXHshrVoRGW+aEDtX1wYQ75SBB02iHOs2ufhSTAGrKPyalynaDCACS+qbg892ZGXFatJGSG2sdlO+FE7uk2cb/XqZWmVm5cYtVttqgDI6PkuTDsrLgXnUKEm6yudTAFkF6EAXjVFUsUmrj5q5xedvgojXGcP2xPKit9psIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHQKionV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fM4ZelIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JBSGtQ867230
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ntOapmwOFM4THMdQd8HVcR
	bWkmCzY8cdEu/NrnzPSm0=; b=NHQKionVsa378dmeShCmpMS67AN3Z/6Y1UrBrq
	Vv7NM2CtycTLTJmNecf3pja0uIXF5WtwHbNFhmnRA1r5RafWCIhq+8kyGSsBF9EV
	T86MthgE8dRkl3igUfgtpV2yrqE5F4xVhe3o8ZaWVRyfU998Boyd74zWbxGuLIU5
	UX7WEIrqZEvbQMfwiezpC58s6eBY1Xg8qBJ/8B800YCnm9WTDkTGimCunXQVlZIn
	EZqfwRiHNGFYyYGxSrCamCD/BOwNbQYVzzu3Ld9orZ3H7Wa0ObHXwqZOvXLVx5Px
	53SZFsQdF/WOMMcBS24/RN4auy9x7hTa9//M2SgNfFimifYw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hvf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575231e4b89so2998985e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196689; x=1779801489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntOapmwOFM4THMdQd8HVcRbWkmCzY8cdEu/NrnzPSm0=;
        b=fM4ZelIwaGECbSlJGLsUctMhZ7vfCmYnyeFqSBlvwmTYhZk83G0hcy7MnMFaHA1l4U
         h5mfjIExCwdzdBXIvSkVorSYcoWR8EuL444UDEdaycQlNCeg6dSnk5YKGyIqDSiquLf4
         Ezzn26S6UQ8tb14QNY+kJC0CEpZDuVz+b/RWys0rDA8Izdpi+XCDCxEDwkfZMAauS6si
         dRusRTEVs6Y5QkffpP6JN0ks16N7rvHHD5/3MFSzZ54mKCkqej4vCDN5IJiJ2mO1Ks+h
         fmYApTlq/geemwHgxwpdOQ85SS6/BZkYeG3S8sSujsfJD3ftpFkxMFjbPqIB4mE6uttA
         iUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196689; x=1779801489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntOapmwOFM4THMdQd8HVcRbWkmCzY8cdEu/NrnzPSm0=;
        b=Zi6ld5o13ZBwkJ98NsQjvteir1NL9JERtMGwLmqv/XkrPHGL5DmNRKKWtdzCPSVgpb
         4MNu3ZA4txHtt0T/iqplXg5oBul6QIGGI0pAmWAmJgmSaKOdCKU68y+268MTaZnGg2Zh
         cD/RaXZPxOrH9nz+yZg+ykUVKb4jh/UTUzHylPcUbpbeOCEqhD78VfHPkSa8mdV2sz8z
         2hzZhnCcJFWdBMOkhTxZcAsCqszZj3VYzBNB6T/njgMxCSeryB251Q+gZtykgGwdHixp
         lS5IdYcXqXGxprOXmD+Hu7U/FupTZbGG2JydKivoh90q6Fpgw82QzljtwQoSohtwzjeD
         CE4g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZfEIf2JmzhMZo0MtLD7BTNr1Er4GwSWOb5AO+n67JWb0+aC7t9jid8H7vKE9/+i7AmUz/fOZ0mTL37IVd@vger.kernel.org
X-Gm-Message-State: AOJu0YxNeFkY5V9DdsPCBE3v/Cs6g8QFSjNMBpBnXvdVnBXJ6OPcASqL
	SFa5UjNTfZ6P/fD1pv4iE+C1EX58j3dxfIGp6/dsabUgdYZa845mWzcQmu7NNscoKRaOSK7IDFE
	kh1GA1iJQ9GnyzjrvZWj8TR2NVlA4rM/qjPaotXqy/TleyvagG9IuuCQzp6PCdUIlz2eA
X-Gm-Gg: Acq92OHnk2RIUlVKvDyxq4nqLryFx2/O7gfsIhxlOxWALEAG0Q7SLrFAks2PMi5g+Fq
	qmOkxAsXkBHCsiVV4nErzdWB7OOpitvDsGw+4cKtV/2SBSjTRt3eqMRIBwvihph9KxgL0h/8Ra2
	KckNBmBvYpoI8Lwii0U64orj45NmBU7WOJ2LmtdK6RpJQa612t3v9iB6xPO5wWG4uwSV3u+Uhhh
	A6GIQuURfQWfk5hDXkhXZ+p+vW1RvMpWMos34FYF9cb3p31j5oQT1WMMknjGNxhBC74lgpGQBIF
	8Lh6UCgQRAS1TIZx3Jl4uXh8n2IRtfjYe2GQ8VvtM7b/HrioA/1Yr6dFUa19pK3ZLgOjowiK234
	/LGo2A7PLFo2ared7DeiHqHK6ORfked3h5XdO1Ih76XwNIobss7Nbzc8bLLQjlw==
X-Received: by 2002:a05:6122:d86:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-5760beb256cmr9493785e0c.2.1779196688655;
        Tue, 19 May 2026 06:18:08 -0700 (PDT)
X-Received: by 2002:a05:6122:d86:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-5760beb256cmr9493659e0c.2.1779196687728;
        Tue, 19 May 2026 06:18:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v17 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Tue, 19 May 2026 15:17:42 +0200
Message-Id: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPZiDGoC/3XRzWoDIRAA4FcJnmvQ8b+nvEfpwd9ESLLNbru0h
 Lx7Z0NDFqoHBxz1U2euZMpjzRN53VzJmOc61eGME25eNiQe/HmfaU2YIMBAcc4EvcThhCHTeEo
 05SmONKrsAucla+YIHvwYc6nfd/XtHeeHOn0O48/9ktku2QenW9xsKaM5phQ9CBx6d6xnPw7bY
 dyTxZvdygDbNBwazqtiIFhnAP4ZnD0R4K6JcIZKKSbLUEzySe6GadpevvwRN5+2GP4s/rA0Ewz
 aFkcLHV5UCtIy6FmwsvABTQvQEs4WYQroXFjPEmvLtC2BFnPa5iCLjbJryZUFom3JpV646ovEz
 phuvdTTkr16qaWDNiihOXYgmZ6lVxZ0/qgXS6qSePQlhNiwbrfbL2amxhsOAwAA
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11281;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XdTe5MprUId+Ss8VqluKB/Ev/oJCk9nXyM0caOBB1s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMAz/ULELhtm6TX5p8exsskW2BcWtGT1+Q7c
 rhrgXkLk9+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAAAKCRAFnS7L/zaE
 wzoVD/oCWz9oLminsPRZgUsnwlYDLrzHDQo4I3mC6exNR/bmGDRdQzD8eeB2fs5hfX4ls5BOuM8
 c7TBzzUnZgr5BHf3f2nLzCtlGgST/6yNUUCdRYqPZFT2TTjZmGWoipGlntt1QK4qY33HIG/1mYb
 avqZhr6VBoiHLVAVAyxxE9fflitW1s8djYqUG6FMgt8dR0G3bXQLK9LR3ZGFrJNg9KXvntjUNAP
 WRfKZ4RpQvdlaS9Frc/SG+3tT092JCz/q9GD6yENGcPUsSosYQh+56ZOShwqqpV6mS+P58vfRvU
 TTQ/A+NyNc2uR4DqZUdV5Mt1xXXLCAz0RffudWUiLR+wgInn6+7j9OPY6+MQsFsEzAATDX7OZNV
 MVEy52+PcNmJB4slIaWG18Lqcf7IjOpZxARasY7TUpOEcCTAG8gEZMyqY94C2daJ6HEGQjhNRLG
 rZG8pM31cxlVAIDlIf6EBosjk32Ac1SMFM2MbefSC0jleQ1zG0BdrPZ+UaAg2CVjZvqT+wL7GSY
 iqmG4cBux1iihdqZzybwu+xTbzmZ3xDajUPyj2clDpAXMn9IbV5h+yWSSKcMzfpjsYiOB5UJO7c
 QKuu83eKa+/n5eUu0FTJgJ/0JB3aO5YOKeeIBtdlAmImDGvhJBoz5IUnfjJ6BKRXXVHzJE9J4un
 iBU7t01681TjTvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXxn1ziiCjLavz
 diZ1Wbcp86sZ6z4lMjowwf9RNwCrW1QJqsFo6gyVtiAEdm9zpH+LVLpG8XG9PEdrsqmUkuZ3gBy
 lKghRBAN865xEVcHTnOGjX3Gc7RDapsW0gAr5XpHQaKTMcdpZyHhFTPmOHkqWdb50FhvgTmi8Fh
 7WuZcp/L9lBN6GHMweNWprrWvl1fzJ8X2/MHmBEsqXLpEYrCnRGsckvu74BoUNqDhouSifaApiw
 FHoW+6CxsUL0rQHJtY4g3jb8yjWf4oX4IPyiFD/KD1c1pUsYH4l0u58qONF/87cCL7BOyqnxyx+
 FMEogg46z3oEAkrHid6MBUTk35YOT1FdmJakTPDK3iuXuGsuPHWmcq+Ukd5//rB30apQIDM3PnX
 Q4VtTWLwSbsn3rXESPHCQOpxyxpxnORrcM+50vfcGvRARdSz3Rx9sPnyZAfmBAwm4/G/bsM6YjB
 2uXL2NULgAajm+klAJQ==
X-Proofpoint-GUID: cShJnvcOJxQEwxq3W5YU6FC546atkLua
X-Proofpoint-ORIG-GUID: cShJnvcOJxQEwxq3W5YU6FC546atkLua
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c6311 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=1ILUEU6bkNkhryyX2VIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108514-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1038457F8E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This revision addresses some issues pointed out by sashiko.

Merging strategy: there are build-time dependencies between the crypto
and DMA patches so the best approach is for Vinod to create an immutable
branch with the DMA part pulled in by the crypto tree.

This iteration continues to build on top of v12 but uses the BAM's NWD
bit on data descriptors as suggested by Stephan. To that end, there are
some more changes like reversing the order of command and data
descriptors queuedy by the QCE driver.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_desc_attach_metadata().

In the specific case of the BAM DMA this translates to sending command
descriptors performing dummy writes with the relevant flags set. The BAM
will then lock all other pipes not related to the current pipe group, and
keep handling the current pipe only until it sees the the unlock bit.

In order for the locking to work correctly, we also need to switch to
using DMA for all register I/O.

On top of this, the series contains some additional tweaks and
refactoring.

The goal of this is not to improve the performance but to prepare the
driver for supporting decryption into secure buffers in the future.

Tested with tcrypt.ko, kcapi and cryptsetup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v17:
- New patch: free the interrupt before disabling the clock in error path
  in probe()
- New patch: cancel the QCE work on device detach
- Hold the channel lock when attaching the metadata
- Reorder the operations in devm_qce_dma_request() to avoid freeing
  memory that may still be used by the DMA channel
- Register algorithms as the last step in QCE's probe() to avoid making
  the resources available to the system before the DMA is fully set up
- Fix error paths in algo request handlers
- Don't pass dmaengine attributes to map_sg_attrs() as it expects
  dma-mapping attribute flags
- Fix a dma mapping leak for command descriptors
- Rebase on top of v7.1-rc4
- Link to v16: https://patch.msgid.link/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com

Changes in v16:
- Fix a reported race between dma_map_sg() called with spinlock taken
  and the corresponding dma_unmap_sg() called without it by moving the
  descriptor locking data into the descriptor struct
- Also queue the TX data descriptors before the command descriptors to
  match what downstream is doing
- Tweak commit messages
- Rebase on top of v7.1-rc1
- Link to v15: https://patch.msgid.link/20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com

Changes in v15:
- Extend the descriptor metadata struct to also carry the channel's
  transfer direction and stop using dmaengine_slave_config() for that
- Link to v14: https://patch.msgid.link/20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com

Changes in v14:
- Don't return an error to a client which wants to use locking on BAM
  that doesn't support it
- Add a comment describing the DMA descriptor metadata structure
- Fix memory leaks
- Remove leftovers from previous iterations
- Propagate errors from dma_cookie_assign() when setting up lock
  descriptors
- Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com

Changes in v13:
- As part of the DMA changes in the QCE driver: reverse the order of
  queueing the descriptors in the QCE driver: queue command descriptors
  with all the register writes first, followed by all the data descriptors,
  this is in line with the recommandations from the BAM HPG
- Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
  parlance) on the data descriptors to ensure that the UNLOCK descriptor
  will not be processed until after they have been processed by the
  engine. While technically the NWD bit is only needed on the final data
  descriptor, it's hard to tell which one *will* be the last from the
  driver's point-of-view and both the downstream driver as well as
  the Qualcomm TZ against which we want to synchronize sets NWD on every
  data descriptor,
- Revert to creating the LOCK/UNLOCK command descriptor pair in one
  place now that the NWD bit is in place,
- Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com

Changes in v12:
- Wait until the transaction is done before queueing the UNLOCK command
  descriptor
- Use descriptor metadata for communicating the scratchpad address to
  the BAM driver
- To that end: reverse the order of the series (first BAM, then QCE) to
  maintain bisectability
- Unmap buffers used for dummy writes after the transaction
- Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com

Changes in v11:
- Use new approach, not requiring the client to be involved in locking.
- Add a patch constifying dma_descriptor_metadata_ops
- Rebase on top of v7.0-rc1
- Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com

Changes in v10:
- Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
- Add a patch constifying the dma engine metadata as the first in the
  series
- Use the VERSION register for dummy lock/unlock writes
- Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org

Changes in v9:
- Drop the global, generic LOCK/UNLOCK flags and instead use DMA
  descriptor metadata ops to pass BAM-specific information from the QCE
  to the DMA engine
- Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org

Changes in v8:
- Rework the command descriptor logic and drop a lot of unneeded code
- Use the physical address for BAM command descriptor access, not the
  mapped DMA address
- Fix the problems with iommu faults on newer platforms
- Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
  commit messages
- Make the BAM locking logic stricter in the DMA engine driver
- Add some additional minor QCE driver refactoring changes to the series
- Lots of small reworks and tweaks to rebase on current mainline and fix
  previous issues
- Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/

Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (14):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: free interrupt before the clock in error path
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Cancel work on device detach
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |  10 +-
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  38 ++++++-
 drivers/crypto/qce/core.h        |  11 ++
 drivers/crypto/qce/dma.c         | 168 +++++++++++++++++++++++------
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 228 +++++++++++++++++++++++++++++++++------
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  14 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 430 insertions(+), 96 deletions(-)
---
base-commit: b4a253871ac29e454a62b6746b0385d52cfe7b24
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


