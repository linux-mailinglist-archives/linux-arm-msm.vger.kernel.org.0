Return-Path: <linux-arm-msm+bounces-94986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEdGISm4pWmDFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:17:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF751DC935
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 817B130FD5F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8B0421A11;
	Mon,  2 Mar 2026 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6SDHWoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ7euTp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498404219E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467064; cv=none; b=ad4lBwufgJJLnsBXKyt30zu0Z/Vw3QfhcdqsNd+0tHrJlMmlSPVSn6NDdfA1bN03Fwm+oPPtkJ++SJASa+y4N2XMzvmTZB8syTzghcBAPR6gOmIoJIZxIM01uk2TuSBbrVIO+0TjQRjo22GQALla4ohZ+vc5mphjNcr4sSswufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467064; c=relaxed/simple;
	bh=6dN4XjHr+6OQnOzxmGwMll0VZH7PW0q5aNlxk1E5+Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJE+Bzif/ky0Dv7mte2Ce4tzcM4BrLwx0B+N3J8osM7sFpZDJt3vpXlmivI9IaDlPyLZYvNdf6bAIbe03CJGdqRlgfZOna1c3UOYWt1ieGscYCdJNwPVcyvGXwo1G6hcdENs4POHN9eNbLvvCLACq6+66Vh/+7u9BwxSa36T6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6SDHWoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJ7euTp2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622DpHZS057664
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=L6SDHWoDuyS8pwP/
	BWEWgMtQNT4qHpXHmncz+8QDZEMvIHQH2z8zGA3D4C6XvWXS3ZodhKqc2RN6zfKE
	MQNd0+b1EtnEV1ZLVtXzebhTyRdKfeF5o9vGd214a0ZRIQPHJmksT+nslXZ9gjOn
	rCJmc5n5BBCK1yghxPxkgvMbX54XET/YeqaZ32sPiP5j4JiBZvHulSQWYqxizXNk
	+9JpZbLooBzyjFK5bBmh16tJF2WbxLDPYvUAWbCFMzVTokT2FjQ/O6OhexVIstqh
	tipLAZXSlJAQXfQxcJ3vvkvRIe9LgUIqiYD4k/Qt93hCbIiKNZ+N1ZKhLy4oxskM
	ctVcYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64b1v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:57:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so3479371085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467061; x=1773071861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=CJ7euTp257iYmL7jRrGXNRljUtp1YEIRIigoWozmRjISatThvzZFUSrp+zrZbWJzDE
         cauL3mOxjBGP6pRK0zizvwpl/cPLbQgQRldc+qEddHVjuKLY7gvmP6HuezhALx2vbgv/
         aL4WY7FkGP5ALbIb9mdS3oNB+Vl3b9mtOCfNwnYXJl7rdSLOP+SWb6Xyx/74eM8LsUcV
         8yPqZYyspNmFsLfaLI+9ybnhJ/dfBxmgq5fN6tBxSGPTO7YrgfLJZ6ySSQNsAkuVGu5o
         leJ1CumqWTpY6I8iX2shQAw6hqTrikG1YXrgBhf6aNplS5xZV7oZpdpyheEUVPByORDe
         vjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467061; x=1773071861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=dc0iQEfnHfP5WHjgxC7qxP9+iFjiZn16gJaXVgCtOQxSAxQm6bX5cuFFgFPV+MASxS
         ijj+vyvLWoC+9in++7FYtg0K/U7rk2DAOJRf1UGXHx0b0tbDGiryhdHm7xx7bXQL3MZe
         N7cD1Dxrr3BMKII6lHuAQbdqsZMStrQNEObHfqCA2hmDRAw5CiysfndUmmP4A3mmes6i
         AtHiG0s2LrR1+122APO5kfOB+Zb/a/qVoB1d44Q88pTQAAtUyuAW5bx16PDsKIJLwXYK
         5S/ZFvIhGlI3qE6mA1B/sIDycJtFE+FL23K6C+dmYzqd23wlt12KCvGIZBgccfCdvHOo
         uEuw==
X-Forwarded-Encrypted: i=1; AJvYcCXLtoeWMmDd8WB7/Cw8KYFDojz1SAVvMplx6oPFP4M6kixEr2FMvd4twEUQ2shsMqrak90Aue/qmM1SfXE0@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7T5xL6+mHXKeYARXOETQ4gV4wkex7un9lLNn22FxUdP+VDPL
	yP7jqpchShqka9eD/8GdtKh+cMfriFNOLiBkz4YPnz7I5UWGxm2XAaL6jEE3G5VuJ6uu07ohRwT
	vCdMJqQUyOdHxurmY0bI7uP1wgH7i+rhmioNKEysOOqRdzFb5KgVtmsYoCkeL/ycNYFCA
X-Gm-Gg: ATEYQzwcbD2invaM4LBIoAQVhvwJSo4hVAcnany35wgtKCyjvbOeKDXfq7UEqMyrUoX
	nxcZWykEFJhTSR9jX7NHdpdMLAPe2H0D851SoS6hb5uvih5moji7q5W86t0uIX5v+5y9DRNGUpN
	Y+YcsX6xWQvqvDlXw+j/ql3ghtUVcVceqmhAYQg26Id9PjYxEsDlU8aPBqkthMBmNBFnro3d9K/
	8YYyZc9RPmWu4d07gORjOIl/Pp0f6YOV05GpeZZOz0UAWnw/e6+G5Ch6gaC6hEEv9n+fmn7nTHb
	nsTuuqSvCR946qKD41I6ATmNjMHomMC5ON1GpvMgwOTfmAtnwue9DSUEPinh5kBaQY5uwfFs0/J
	TraDwFfAxv2qPLWr3H3tC3du6zDcYovQtdnuxf3fZYxB6DdOYl3lT
X-Received: by 2002:a05:620a:4509:b0:8c6:e11c:5ebc with SMTP id af79cd13be357-8cbc8ddd208mr1694529685a.18.1772467061635;
        Mon, 02 Mar 2026 07:57:41 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:8c6:e11c:5ebc with SMTP id af79cd13be357-8cbc8ddd208mr1694524985a.18.1772467061130;
        Mon, 02 Mar 2026 07:57:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:15 +0100
Subject: [PATCH RFC v11 02/12] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-2-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNkOhcfZbOa+wMaID6vgraXOKRBMT7qNcfsB
 Wzz3K6XPTyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzZAAKCRAFnS7L/zaE
 w+OID/4mTtlXpEUiB3RNmRgLvY6eej5CSRNCAUPyC2kO/mA+7dv6YhEYDmXv1jpNLaNml/Ahwqa
 Pp9geYv7K/Dp9cQXoZlWCNRCZ1lWarrGJhSNhWaix+8xVHLCJJDXpP/gd/J1llkVo2gTEhSBSl6
 t2QQMk802Ju777yCvSsPxucUjOcq1V5i4TmuvTUT2+p2SdSl7rcxNKHW8zVeKN9OJ9PjO5F657l
 LNEnuAlD4iMlfsLKMLvKjusBOCO6H9kS6aLEo0KvSwZmQFsGUL8n3P93O2R56Ey4EJEUHoiNJ4k
 hG3tFVMb1tNFJf1J8LagBHhRU9avV+NK1Xl+Fmu+qUvN/43k/YNkPeK0aThQoZc8Y3YZaaKaT3X
 mDRoTu6uIunjByGj0HVODLCdmK6cYN12YGT8F4Xhr2tGs4nJPLsQ7ngqpJLspGr3yWJq54Qtpmt
 qVPRygk6pldWuE21E9oZr2qYuo2P/JEbnQvawoASRmxFfH0uN4UGgH3B1usJRNoRzwF0m3CYRg8
 sHQbbyFUDTbU9YyjAu12sHfMfrboLyGQa0V79cZtLMH65Ub2SKCmigDTGL4OUt/Th2kytc7mHQ8
 MugneSEySKGuYI+BR85fQpW8kzYQLvQyyJpAVPg7oHWNSYyP3BaP0C3nAqxE/NpqA8CnM4kSQPV
 KQyk3QdCdJ/ngqg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Cm4NgDPljmmz1efJ8fVZ9nBbh-idUaTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXwQnPAd0ZalEZ
 0f6GmoQ4X8YpxaGYYsQ6qg5JlAap1hzHOELl1CkgC9J2Puq21DXM6eEQ1tf68YdpgscfMaPcFyS
 7nE1NORmdbYQ334jEmv2Yx8mGhmTWmBJ6et6AbXNT+QuZLfMGwXsTFdaTcSG4f6fsWDbAKIyraS
 1JZNonb7RfoudKaJirpm/qHS3SSVqfmE3iLMS9qwGoM2hT2BQHqOwGc1U0FGPx8DXZfS61DiQ9+
 qkSVFrLkZSMtOLVLVODHiNp/YquRHZT7bezvocN0jzMEsfsAm+SL4JzB2g6XMvp2okINfrFnh28
 CrmX6mGb4kxpYYSCkb3y/mvKCC+qEdi6oVu3jry3PCrRbKVCuAGRX3T9cLrX3FgweotD6D8ZJc0
 Cq61aSbHSGBe1xKQhRAH++hIUdWAMpp7jqEMZJZMS6JzajvgYnt0cefTsFkpY+M4UN71sqA1YP3
 qPeSkcOSa2ykbZp2BKw==
X-Proofpoint-ORIG-GUID: Cm4NgDPljmmz1efJ8fVZ9nBbh-idUaTD
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5b376 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-Rspamd-Queue-Id: 1AF751DC935
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94986-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


