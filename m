Return-Path: <linux-arm-msm+bounces-114951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KzapERNEQmqJ3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:08:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACD6D8B16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:08:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UI0gMh7G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zn+zZULK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114951-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114951-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7136330A5DD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588363FD96E;
	Mon, 29 Jun 2026 10:01:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA23FC5A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727306; cv=none; b=jR+rgquNOLDed6XUCGWwcRNpuJxWQG2Rjqf+4VKDoYdeLPduakBPl7Jc/YqVfri0bSMcx55Dl/PR/qYCnsUfps8QWnPw8NWMY3rO3siUrfYVU7F7ubZ+Xnq1/53CVsdqvUfQOb8KqVvV33+eJscCUR5w0/rmlbenqBD++mebetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727306; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pycs37TUGyyoSkOa2QC8rH85fBOSJj7gHZG+MrHXbTVBAR1QyLj08xuFNMOU5nUb5Cs4dWjRo+tEZ0f0RXquEIMKUchmf5eu37xQv4102AuZyzsCrZYbZ33ac7TcETEoLBQ3V4tHhAZzCfMG2RNnqRoToPQXIQ6xKledQnWjepo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UI0gMh7G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zn+zZULK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xEWZ2447420
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=UI0gMh7G9/BxQuDe
	2oTQhN1GZDkR6J5JyO18ZkYYzav5oG8XdQ1ND4iD6FZLwMWX7yZOjvm1YKH3Yp2F
	KDFjFFILjqtmeVTt4IREZyzipndGDH/C8Okw+I/7+x2Ql6SoPVJmDwttWkB2CPKJ
	o61luCPpFMqS7ci2GBmcupRtpLgeq8H+bpqX5TOFIk7mq2EDKrS7oApu0mpz86YZ
	t1wuXOgcNYDT+PB0bA3z9YbgAm1OkDgg2jx9XSHVW0zsk6L4h9dCTNnqEaRVhjvP
	qHKJav34vUz42UIX9BOue67rLI9j56XA9yPMkgazCVXFxoQoN+bqd41BUZY+Hg++
	bOZ80Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7g8bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9692731af28so1075340241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727303; x=1783332103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=Zn+zZULKhuA6cz5S+5l8iLW6gcAmtoQSUHLKoVFFcK8YTCaZuwPIDk56sZZDug2amV
         4XUopL5x8WdrByz1vJ9/NeKVN171QVTacTf1W07ukqmazfiGnmuAbVojKg/n5NbcuLwX
         tOjIXof4sFqSo3jUkL7GPxURLITBXDSOHNJgYYUSU3ou+R7+90PysXpd6zqPubGFEqLe
         /WZY/rShf2r7erXXN9SbdN7RCaehC4P6K0r+JNHRjrZ3lSap1u8i3n82pCaAxcRzwyyq
         6J9zu6lycLV541VqFp12RGm709xvwG9kLwBeX1ZcIlFefKlSGOFulff4uRqwXXDW3n+e
         6zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727303; x=1783332103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=UspzfGIVbwZWlhmMpDTaJJFjdngve5r9L79VHGFnV5OYb3qrQeyWPvb3vMe5QEomCP
         Jz9fV7XH2NBtuDnwi/YlGOXaG7rhyZi7pcg0qEkJNm6ppIGviMOAbvFTrB4PjQODvUGj
         snBYVnklvvqNkTRIpZMQicBGeZbBEKlUke4WwuQmHtfrrkKxkNvDPnGg/GocvSVdqJV5
         cZWKRIHH9Wur28uG8XNK+xkvMe/RXcDvOaDG2S9lpggY65PiMluLZDMh7I2kxzMQAza3
         ZpprPNCPuK+GGcqW/pF3OpG1+b87aHzfg3CB2STRlvQmE6HW1EHcJMArDIykIZKwlTKN
         E5zw==
X-Forwarded-Encrypted: i=1; AHgh+RoKFhYTcsthNm+4lQfYyVFxQOSta5ClvIxPn8474Qy0M4+WPHNjnJ+16l6KJN8q7TKf8HIjBOA0xxIPtIyy@vger.kernel.org
X-Gm-Message-State: AOJu0YybTolC8YbdRYyi3w2jFDCpt9Ftb9givtAhGjIRfcPR+PPh4zR/
	NkzSo7ov7ywfgeqRAtoDSYDR54FUACqYZ8howGvV3MxoBjbnSOU1yXkljl6qeQhj7qBGTZ/rSVD
	NPocO277j4YLh1ZkN4zjjZ76LT3MPU9pvIZwyK0+Y30HWCUVMPigfogNMLgmfTDHlss6e
X-Gm-Gg: AfdE7cl36sXQAoYazE6EmvuK81UauBZtiZoyLN1sktsNaFWuUb9C88JY/T2bHAtFcL9
	Yg66cwVd5Di1pAcYcS3HrQLGMOVrHTgEmyu6y1vhJM9NjrPfrl2CfeM29IUFsfHNb0DVaEk4uYu
	Li5q7DxCXF5MhQ3DuK/HljXaUo7c3bYeMfUrKO2GoIA9RCfMb/vunrlXbqmlVIlE0otaF47Ovn4
	js/K0AAE5h0EjfOxzIRW9AsrjLtgyP09jrF5vZVDTpfckV05zWSwoDIKGnslPntu6aaKbqnilkM
	JUExWB13nnsZWtFLiLnK9ac6mL3C3ex3SVlaEw71Mf6UKazdTW/uu5YWSuG7JtAjP4qUUIx9gRU
	gxch5nh6O7nJsZ7iZM63JlP/Vn8nus+1rKdytp4GL
X-Received: by 2002:a05:6102:2b84:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73434037ba5mr5559557137.5.1782727298331;
        Mon, 29 Jun 2026 03:01:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2b84:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73434037ba5mr5559506137.5.1782727297785;
        Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:07 +0200
Subject: [PATCH v20 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-5-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJsmv/o1deas2zWEHYrq8lFB74FXE5e17jFN
 KDp7w5BZ2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbAAKCRAFnS7L/zaE
 w5mDD/0dvYsn8wcOxoenL45TBXSA8eIJDIl3WnXKcembWmr26XchibGSAHvzgZJctIVAo5xCnMx
 7+Edz2oy35G5iWFqChbqYmOWOPtmX9/67YoQ4FoEfxLgbcfupubEkvaWaVMECA3Pwp1Gb+x+zlC
 +1zjrfZdDGt7rQXLiDf/Wn/drI4XdP83uvvKckIMshgyANpYJg30TNf4BqDWW5RYbfJgkODHDH/
 /Tn4M76WYCpM4yAvguy9VyuN0mwwf0h3snS/klxm7ak95iUvTwT5ajSzSA1OZq1inYpL2zlOfgu
 1ZSPMczAbt/yJHNeW0+qk3SAbOEL41DKRu07/fjNy/6ppBp8hLc3tG+SRBGSMKyjAUEvHyJntCP
 u0EwNeEhCdATHfccGu6mHCdzz6XPiwEAOwMyo7H3x+oExfaJCA7A+TSid8quk13UvJ/WfWcvDfb
 1HISaclIm7oHGQlkGofN2HBon2I7yRTDV2PH6Oymxq3K+Z4Hb4cnq86zLu8ObzLpi0/hCxxHDYJ
 L+P5FXXnPZ+xnHgDczHNHX6J4w84Ql3lDpLPtlLQgRaiRO6kTD50G1a8V6AuBB7Toq4tW0gNKlA
 7/jLfL748dBJy/CncsCWcE/ZsVAmFY6e3Bn5Bb8ttFurbl4Hq+78K5JWaDhH0ecbY/N4oCWll4M
 ijiy6x8iosCX4sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX5MINlydUfFZD
 rSwX5zabw2NdRMTpMemxzu92S9EV7r96qJRosBx/7Z4EKJu8RPvp8cqBh0iiFsn0k6n9sj83qcA
 vKP2yF6un4zXXUuZ6ViGIDqXdn9i8bp6UZxgA28mgOfoKkTcIJK9ir37g0TmZ9kUR98FBOF2Alv
 /lbtVr4Bz4e8TR1qCcV48+7At8H15pwgit9sbkE55xi+pto6Ft2OprJCxPxxiL0DqqgXlzyEtbn
 BsvyXJ5KkC6/mGopKztsOm/0Itdh1SyNcS+4VIxokbWmANSgLFY4HWPw/400ToymJyFphJPH3Ob
 +fkoRtBgKcMGKn2J0kniXjC11ZOFT7kWWRzq+FZO47CfyYCFbrGy9D3IPtx3cA+3atvumtGkxOy
 mde91ICXCV+cXKMGLRhkm8w6E9isgc8L0eSmemPTYPHD7JVqrjW/d1xPGLvRTEnLoqpT+0QKTOW
 PTaiWndTZKRwgYXeOIA==
X-Proofpoint-GUID: qrbsra3--c_CfzawqDvk2U5domhPHF4K
X-Proofpoint-ORIG-GUID: qrbsra3--c_CfzawqDvk2U5domhPHF4K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXzge90jAg75Pd
 XTcheHQm7zel4KhwZVswl2FmjScTXv/cD1NWvexFMUMBW6WsPRiKAedjELanfPnS6szfmnj3NDj
 ZpDpYlAgQDfT18LoSa6AbEjmmNshEFw=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a424287 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114951-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BACD6D8B16

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


