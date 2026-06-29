Return-Path: <linux-arm-msm+bounces-114952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BEe1JOdDQmpl3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1826D8ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A0ka6O8L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cvgCI/Wm";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114952-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114952-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E3B93020FF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945503FF8B0;
	Mon, 29 Jun 2026 10:01:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD13FF882
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727307; cv=none; b=M9CMK+h/FFdwXdTOaUCYiYBZALINWJrXRQ8UC30MXkmqPmvSVVwmk3knvR8b8MT6ZkoVZqV4PQN14NgM29dTVmMnRSWSqhjgW+pJQjO0Qd3t92cXMuNkqMSrW4uVvuQdydSa7T8Gd2nq+dRkf5I5QwdGYMPQXFeshza50DCzVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727307; c=relaxed/simple;
	bh=bxwOj+1r4hE0BIdCr6O2vUvIE65d0GfBKW7+Xew4ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K0bx2WvCbD2308EFILXurz45HAPp6c3A5MtRTjPb29GMmk7u5vkpGlIEIGX7T9rdv+Foi+TmaItIOY3UuNcyHIXd3Pk9WleelGJ7KcwKNr7C5EMorv6cYJAkYjPjoI96v2giUefcdaMgg/p/HZvdS4lWh1ObqTbG0tEsVDqGqKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0ka6O8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvgCI/Wm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8afcn2368439
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=A0ka6O8LtQj50Nf+
	xqmQXunSe9B7gTf38ZRn7tK8X6JjzgPsTFKQp6oY81MmP3z+Uj8Dcw1sHlgs3dgt
	TPqsnhf5134g04V/dXYb24PcCrnQEaZuezQX6TUmrfW9A/63IbSDD8r1dWSjvHvN
	4fLghUoydYLPpW4z9Xh16lUlFvYKTHe+9WF3l8/PGuF8+vKDZsIT8EJnyDMeruok
	RCdIohzWdpRjBIjViNIOQv1gP54lslY6wOtFq/Urm/3QsS05MSRxij4FZQaBI0E8
	i+eQ6ZJBlAksCe7PfoaGAByvk9om4Sfpdnt8Bgvbo9M743J2BHihnieu/3jr/z88
	efcSeQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrbb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48976713b46so3017622b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727304; x=1783332104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=cvgCI/WmYAgNYuklgHqt1P50yu+AN+vYEF4bh3kd2DWY9zQDMMmSBHpUlzoYF+eaVM
         KiG8uahlIOF9t/0shy0UNFzLs+3Y09mSHWJXmm0fjMM2Vv3SvEH91hElr5DdbnNycebT
         cyH+EaVCm+IhrOAM3SqDjlmiYU+aWIsNsk4jt6KQCdtrzJ903fDuq7wIgM8fsMg+QghF
         Btbjs39Netraxj26CbL9WRQ9KDL9zk5aIXOvtlPHbPJMlkBmVegxID819p8FUEzy3khI
         lbNwiFnAh/UJ8jVKFBToYDNn9d564zBqkBTnGB1E+BZUqwpwIoQx9KsmJku9LwQ03g6a
         J0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727304; x=1783332104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=pl1/U0/t7tbLeZCc3bEkPf/bDawptakddUhKBfL/2wfM3ubHHxv6aGMdXVrC4YyhcP
         pV0uWqg+YS1IjRpRm35yE8BjXAT2PWYzcTS++Gdma6oKRFJ3Q2shJd67A2HRJRSC0SsF
         HgVaCuMRMSHfMb3y6Yjl4BVaA9EyVeaz1wPd15MiAVPU3AapwMQBkpHUXXgWk/DrQ3ib
         +9fgk3WZFKc+aEH+eFqK01+kgQ6hXvLdppQrPr5xaLSDjWbL9boUKrBTO0YQC3eY/IMH
         Kc6CVp3R5fGqwVQHy/WaRjl5Ox7CUv6zJDpIQvKpyBhlUqI6ESCem8Z1uS6J8ty+7+Yb
         qWQw==
X-Forwarded-Encrypted: i=1; AFNElJ/pFtYeZQH7ft3recoNXhk7qjVnDALlc0sbD9tV1PW8Ky6h9kyFCLzv2ziKmOovXuOjVExk6j+ZmD8rNyWC@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUBUtZgD5DWw2c8NXJyH1ux5ak0TL6bdZ44svy+yx47Zp+jTi
	xq+BlpwgLuSb9Kw2qdbGJ6uPP2clWD/AtolXr/X/Vom9QSNFpzMTJpL7mpVwFYL0n9JkkiBCVaz
	THwBS/0A587SZWtHv6oklSJmMuqLCzsWsR7/Ugaub/jVgOlORPXuA2fWMGQEItNFDXKLw
X-Gm-Gg: AfdE7cnQ11K5C5nKEwfbtdjyhBXeqwP0pvV7XcDZjxSPQnswPDlwf+ma3nk9B31ZPTF
	arXieo1vs1hie14WMO9G4wvQcMIjDWEPOUjrkbIhxcQGceiUE/JG3O2iugPr7VVZyeVZt+scjoe
	X4lPBzG1SrGB5FSq8W43lRLwXL7jCF9E0xP0CAuLVB5XbQIy4R7inG/q0yNPTLvpyF4hTrKNoKG
	7m7G1pPxfI+Cz35fZFkFPZaCsXDZW556EjmQqWSCvvzyDe3XtRz328G7ZUeu5I7338FmtKfGz5R
	+VkDCNBFZhpEhDHuwxvASIWaewy5iTB90dbQuOH8gbbgM91GrHxe/k9Mf2cGijQJcbxKbm0N0yr
	0aSXBX+9ys6Vm0Zb+zhjcJF19IxiXgk6aRoC1L++1
X-Received: by 2002:a05:6808:14c3:b0:495:d41b:10 with SMTP id 5614622812f47-495d42a46c2mr1731335b6e.1.1782727304407;
        Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
X-Received: by 2002:a05:6808:14c3:b0:495:d41b:10 with SMTP id 5614622812f47-495d42a46c2mr1731296b6e.1.1782727303830;
        Mon, 29 Jun 2026 03:01:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:10 +0200
Subject: [PATCH v20 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-8-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJwZW/a1/FuvH+070Jy1CpCEea0E8JvEmVzo
 Vx9kiBjUdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcAAKCRAFnS7L/zaE
 wxs1EACIsX7YXdr0sjn4qm314IKBsfprLT063avihs0rpsQj/lF6gjwKnOvz7YbgGt07qTdu471
 NjRS+H5wDqPpZsXjIsJYB1SyURJB/A4vHaxe+rz827ME9Khl/5mFQmZGQKJ6VVBNDEeqhXBVzRb
 hhu6lfcmYU21pyqYv6ipDsw2IJLmT9SUab0OrNtYv/7anpnWBCeZtAmY+gQMs5ZzVX05GL3k2wG
 D6mCAWaJr1JU5Z8oNvbXBr3ayY0WvK1YgyRwT8GsqDPJ8PrOhZ7iai8WOjYiO7h0U236rSUoQ44
 jjpq5qor9RFHTMWJQTs+EPy1AROczrf3asQpQ70STVF35srSGEIekQES2mweoQoWTaR8Cwf815v
 cPqwvRX8JzY8lOsrxl1aOCGk9pZGD8zkwqo8jiquq8Gf6M3b1tLu4LFo2uLNTK1zvvDkIWsO53G
 Bi8P+hxhFmVDauM6iWRl+iWtfflXiJByzL3Kp+l8ZtlL08hm5XTieSj5In+jxdOir7YxN9zZjZP
 o+QWqZwbW5Pz+iqBhCfQz8nWjv1TqVlRb/dhlL29VgtdmsmNLDKmGYtOJRglb9Q1PozGlxdW7iT
 bziZJdpTgOL2VhzrJc1tG/dceQ8OLmKsS3Oc8O5joydTPZMfAeujfQKVVUKBS5lDpXovjURgMVL
 p9Zrsp/UAdloztg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 2OqAA0N5aHENae_rPx9KBSV_jfdLrXzK
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a424289 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX5iBxtdSSFDq6
 K3cBQvDqb2N+SGW8Ovsn4paSv1Hm0I05giodAmnOFRVq4HXniKvSzoiWGmUZel+PbJMka3EO8+Q
 1YlHb8HcMURA0TlXBGDF3ZSeNLCvnkc=
X-Proofpoint-GUID: 2OqAA0N5aHENae_rPx9KBSV_jfdLrXzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX9mAaM8jC6K3v
 JYGNNV8gMNmn+fTXTBmbh00ewF8liiCdiqr36OkTQ4Gl58bW34H+9DWWj0i/rSrA0l0ZpaIWHCj
 Pk4fjw/lniMkyNEdPDh8BS4nrRd2fEYkY8eMVWZBl2DEqbQMI7Yx8ucvi/OaFuUComDk95lnMqN
 zRPUlQZ9PW97g7N1gSwMCPis4uRCK18TmMRGzQhUJd7/0g2OVn9X4qoPKeoqL5dX38OJycAUcAy
 4Dw/7kNxg2YgDo3mEsOWn9qo9fKvB1ku6pYCOFoL/8zgwdpMcxn0nadjpHnUYRbkwW830jYE31C
 +tfQ6J8yFSzCsoVzaeoSyfcURN+1l+0ip/jpQZDn/lIpdBVPDmo9XNdk7FGIYm05yNxuYGH3br/
 GjZZgUyGbHBzfjwOkfcryDH4cGX2AVLjS1HnkRXSmsO1Fva8jphmEkJXb8ZOgSJUHkzx5/BwKcF
 7DBVvn87hxCTF9G853w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 0C1826D8ABE

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index f671946cf7351cd5f0c319909bafd87e3af701c7..ad37c2b8ae53a373bb248aff06c3b7946e8439a8 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


