Return-Path: <linux-arm-msm+bounces-118780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ml54AGTjVGoYggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:08:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935174B521
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:08:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TKwMSV98;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DUujr7+u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 165233075CE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC12423164;
	Mon, 13 Jul 2026 13:02:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30E417346
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947726; cv=none; b=T+hIQE24aa6G3SzmTANIQaJuhKRL1ZVJ6HqKwrb+DI90eLfv3xrsSGi3HZP/A74SXQclMWcJrCPzn5NzzPkf0Atq3+smP2d8ybxY1H66O3eFHvS8YOt+YeINxOOo13oxe/XC5XwptaPChTav31tiiXyUanjvlneeBepHjVRoC/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947726; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oc5xAkd++3aV3l9uxe/i+VcqxKKTnfiAd1886PQI/ANPx+v8rxQDa5XDSsKkarZx8APznKSPid14gfV7ZYNW1cUpC9LiRg/KVrlTSQuNXky4xuH7EFL2RCjtsFYSVSHIgRSmVyR17m3wMouzNJQNjR8klUQMpvTqK2M1/GI1Rzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKwMSV98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUujr7+u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEEV11210821
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=TKwMSV98S9Pnsx26
	KkuLfaI756DKEf7K1DTY7r6ZVk4EjqvMmE1y4JlOlD4eWyOR0e3avJ93fOj+eHNb
	4eSS0OQpeKKYUFCztUyDKx680FFfmOK1KtDpFUnMa2n1Itgu+WF5IVvrk19D+rvx
	k2ftv0WNM1S9fOy8odZoQ8no7SfZDgdfyCFkLVY58Dowjr0Clpb/R+cfIK5nAtD5
	BY/acZZKQ96GzYHEdk9FljFslVNeFGOdHkYlsihZ+ho0b0BtgJxeB3TzUvpLWgbT
	uq8l6kIxUFBiyXwOEwJOGiyD/BLmQ7A4OIDAJXtM6bbE3NJugJAjmMbPVT7AN1ow
	CYNBoA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrtfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:04 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a18e349abfso3974924eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947723; x=1784552523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=DUujr7+uvqgkN6RbtmY2tBKf6zJbzj3f5I1b+AamqWswLMWMZYuWdRXnGfGquvf4Oq
         o5h3EplRIt4f3x80WWSqfLYKwflTJQog88EaaE3L1naJ6DjPmln8VAsSh3L3RYmwpqj0
         tbArESBGjmiUXKR5yHqGUTRNtlSrblHAgDRiPN3VHAIlRfyCfsAkYAoiUGWVWrYZbf3l
         zYT251Cy99itiPRUQN1Ba+p1mWhjVpjPh/EmS9wPXKNo4qBIECe05PTSoz8ldR5bMnB8
         nPWk2+qW5OJH5ge/utkLOd1NscV0UuSBEAtjjsCGXwUR1TyBQCoT09FLvPFjKxflNuGd
         txvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947723; x=1784552523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=ZOKp3aTFFm+oz6BqinaAQIVuXumIGK5+N7dPPA+XSIi0BdKL77D1C2YVVM2XcVb6W4
         01tHPIKnhvlKUzvieljZ9dh0CywyZN/L/+nswQuU1fCWOOqIDJCvjlX+58o6cAi2aePy
         qzvuZPcMazQghQxXwIdCqzQjIjY5PIPiDHRHRMOeJtG1RvEqt4uMUB7x9r45mVaao9OM
         5/BzxWMBd3K2rAs8wqtqZi5lWdADD31GgGeFGEB1C7gBudb9QnyjWnuRWRIr8HA+VeTY
         BhZMcdsgDvDHX/dz5+xaHH7BiF2qZS9VoZMW4B5fLoU6zjAzMXYttxvF2/z2kiS1Um63
         J/rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TQRdXP7h9ZT7qlBqo9Asme76b9whi3qmEDPRzMZvmaPcmuF8LRYTrnTib3qx775056PRaUs0cZCa8QUt7@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKmmYqSLwl9M0j5n29MH/A9WRZOw6ewVFqJvMBiMsQPjxdjXv
	MyF5zNRzzM6YP/fFd9bzg4k5jyvZ5Hqcv75EiPCtpAj0JHJ4fFe70ahvs3Su3mHFOBqCDrJiPoG
	JMoTebaCmdP3I8Vn9629NSuTiwKG8MnRyEjwZ0eEHgmkKDRv45DdUX7hC4aPDX/BtgLFw
X-Gm-Gg: AfdE7clwH17NyVWEn22QJhOiUctT4tlMxsdVkRfzVvLTc0fKs4qcCOJeDWJilD1qk4w
	V8U1Iu3rBwP5cJzsJgY6TQu28uFJ2LPyTk6OeS4eyvhtzPASvxqYBeWcioXCBQpaPZQr9HUCnZd
	h2JURdsHr+93mTh1y5ShaU7fLhYOQmOvyoQy7pXBdCO2yBquooHoa0CNlWWEOk8lkJWVYgjvhfd
	xY3n73DVITrKTFCgM49UWeKAemNPYMTSg/k9EDTAqn4JyNYg1ev1/JD6W9PqEN3G/QFTCxvPPdw
	/JE7UFIehpE2GJliXHmHA0ZDlfzVKx9T9HcsXeIv3vReMfDrMzx2usD+rySdqVAX1YtSsgzPun1
	tL5iMYnl9Ou5CKTVgGb285bpBwTq28e9k52MKvfv4
X-Received: by 2002:a05:6820:f00e:b0:69e:5e9b:a47d with SMTP id 006d021491bc7-6a38b887ca9mr6712871eaf.5.1783947723214;
        Mon, 13 Jul 2026 06:02:03 -0700 (PDT)
X-Received: by 2002:a05:6820:f00e:b0:69e:5e9b:a47d with SMTP id 006d021491bc7-6a38b887ca9mr6712811eaf.5.1783947722306;
        Mon, 13 Jul 2026 06:02:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:12 +0200
Subject: [PATCH v21 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-11-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGfa3qCCvUSTBUNBBBq4Lg8R9jvA1p2051gH
 Jtq7nsynmiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnwAKCRAFnS7L/zaE
 w4/WD/4hgXQX2CSj/PnOZODDHnT6Q80RgU+fJzQ+FnT+fJXkgjxpy6MXvm21TuAboGFwGrZupza
 9Vk7rAIcG4P1wb96wFHFQkbF+hYoYaMldGMV3zRdObffQgZK7Z3ZUkZoAkLU8q8U8LjGnGSaR1g
 KP4n1EWkH6CMar358JbT3NP781GXxlUxl4lgqlulMJZp6b9Kt+0W4pRtZvCzlDUP06p63W3pL5C
 2XejF+uAhdaGj2IcGhvB/tPsUfmxWQZX3I2qNLdIehPMkt4tBwTaWcvQSTOPD/3IIOixtzuO4A+
 oHZAmSP0RHRWw14tqZQkjxjkbC8Vi1StCibKANBELkTRxu+xyDELWC5wDENgq+u/TAkXjEwUNxb
 pQ1TLhJM+5FRqqDB2jJXdbZz6b2/qyxUDPZgzIuKDmN9+YDX0jRdn71ai9nT2q6K4cyw0j69Iwq
 2Mt4ydFuvKnpW7l3RW5+GPTkiQNQ5Vv4l+iAuO/Z1+yJx+YGQWWFRG5q+Y5mJUPslYyn6T9n5s9
 Y29vSuDdbRCeKwOvXopztBB2TMXk3ddWjVz2nvYg7LwNw2YZSpAffYEtmo40DIutQX7o5SMNUX6
 2KRuEJuMdGW/TkJA6Hs1aOckqLpgY1UdsFZ3E9Rsx5+BIpKbr6RtQlOespje+u2xmNsRyQQR54M
 AHNiypLa8FuVBRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4FAHjEUkV9V6
 HkHgMmLtqvd4zMZOMGP7FAiIZF4cWwkol6Z/Eje/yeyfoqGjLeBllreGkZURvhpaYHGEbpFj9wj
 xxWFolAIGqN+JfUVsITYxdmUdDlVTtcPRQ+3kSDgMK7H7Ms9jGWZAdoAGN9RznIdKc5NKya/sCM
 QCwEshAT1pqEbY6wbBTEVM6K6LYmaUEthqYt6hupevpdcZ6yDQC04KanLJeMvUfigEweqWwT+2H
 nezxwz8hAAvO3Z/+ahsos5XJqJ17JyaOZpyUW4RLSsM7vk9wW6xnotSnYMqbhMjKT/fxgmAzgcE
 V6sYKMQOcPjooKHn7Zm+zxYwfs8EqyQBJ/YxM7SWnle6XyEZgeH/EzQBcsbolKW/uxcrISF7RoU
 JdMDg3B4R39VDAvZpVL7wYCifVZhRlOiFwVN6nLNKddOQHWOw3kPAgT99nLjrd4dZ535EuKybLt
 MgWXxtc9RsKGkc2uLlQ==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54e1cc cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2UrUurGUdd7QE2N8VFnmAs3rTyeEjrRb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX5aTeKx9NQw9z
 0NSr26GqMOBeyAZNi+Rn+SZ6UAZA339A6tYJfhIk1TDTCMq7GZPaVsl09d4s/O5t3vCgaJO33Ac
 +30CAlIYoNzmef6rIxfdmvl6Gug6yi4=
X-Proofpoint-ORIG-GUID: 2UrUurGUdd7QE2N8VFnmAs3rTyeEjrRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
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
	TAGGED_FROM(0.00)[bounces-118780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 7935174B521

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3


