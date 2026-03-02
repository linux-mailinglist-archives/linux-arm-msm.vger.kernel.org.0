Return-Path: <linux-arm-msm+bounces-94987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMgSF361pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:06:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6B1DC5C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46FE23199D44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755CA421F18;
	Mon,  2 Mar 2026 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ6hsgyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZB8WwlSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30674421EEE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467066; cv=none; b=nYbfbxcCVWsMBkhUcxxosKUpgmrss9Z55KKpu1iy6HGzciMeMJkqpOsza2rTWMPBIaRjEIxS3Se55HCv787krHvAC8ylOIsZnrfbiKSGaJ+/k9T7RnZAR1/Lb6uMziM5UVOvKmaOSdMv7Ojhy63ajohOD6f6XASksAhFtXtalCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467066; c=relaxed/simple;
	bh=H6RGZzI1m6Hy642I73fornlozWd6x9hkPKo2H6raYsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmBKnPz9v8g0fnbbXyZFH97r62pLgzhO3TURVZjOdvOWQNGpdSw+e3TzFP2427rb9l0kw48Sj+55oeSd4sj0OT+2feUSLhoop/aBsYzR+wlTvrvqrEyVWXTpnYFTgwwFRgB+/v06sNzrnD1LpqQvMVVYBpONUwmQPJPTahwEliw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ6hsgyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZB8WwlSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294ahj3753087
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=aQ6hsgyOrwv/XjdN
	K6Cy1RvPnmTtr8oQNppm7QSEZF9mP1iAI3EE/3M4IRTINiC2ljQ1DugLmN5+A8EI
	f6D9yuyLC6kLqgbo8tUw7owiDL2E2wgdeIpGjG6gX2L2o7CKwaF9v5VOc6SwLRRE
	0KENO3c0sOQXBk/iI63PbC0L38Z+0TRsqwdXzhq6n0SRF2/tnk7c2CSPy+lPFseu
	aNIM671nmsTIEBp6Gx6W0IkAB/lWEjnWoCJt+eDcQyTOWPrfKdDLBsdqiqr3DAcG
	NnYiWmjjykkIZT7ccuroU8D/rC6/lor85rvxvfQiVJ9u2tEieZS92yK5coEANcqB
	sFJWPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq9dfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:57:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so3024668485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467063; x=1773071863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=ZB8WwlSuse7BiTXACl5UBM/OY1btuxvzp01Cc70gst60tDfIw/E/tpMG06lAETbfLt
         bm+RkMv5RIJrAYOmmGGdwv0uBUjjpPMC9VwVqukyG7LqVNury7WGhY4EyJXfWl10YHNc
         +zMnhswz0YrCHSvBlTWZ/tomtr1eJKZHJLUV5FnuwexFNGGrk20R6f2V51klENHMnVHS
         mawzgTuZDAvuytzdXGCo4ri3cH1rf5nvEEzZrSNxxSOU807W8HxiV0+CSvFdAfcxiAXs
         PndJGdDAzS70IkpO+Hoeqm5+7SBdeyYdEql94tbunTagXIDHPUNceN9U6ZKdzgaaTbx3
         NETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467063; x=1773071863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=iScfkZfni3oe6AZFSUTPYNk+YidIXvbfCb091qoXDMK+AgcEDlnYZyvOCzhdBYy2ZH
         wyaJIANJUQ5FmJrbb2t8i8rXVCp3QTXTPM1jWWaNmKvDZskNDXpjXCBv+QNY0/8eSZGC
         gwZ6hivGTsIOmuQurLxI57p4PtHIxJD7drdh5CclxiuKOAFRkPMOGbMiWO9S6OsUjnKj
         yYITFU/oJ+1PKbE3IzRngwAlfmktzp4imXy8OIZVI45NVHWlJe6mENWT+ixtoLkyGxxV
         2AaNDaP11Bd/jYlwvrTvAd0/JnD2Q0TNk9hHgx4koBImLzigDLNsmRCt26xNUSs76P0A
         IRqg==
X-Forwarded-Encrypted: i=1; AJvYcCUiBiLj9mxoX/dhXmA8R3/cAY/GFheUj408QlnKmQlFRT+L03miWWlkpBicYZe0PyR5MXEPnWRZYDR7yWcX@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJItiMbfOZ6r9jt8ofXuLaLjyyElmQOlQBER5JMShpP31z5b9
	F/s6RgTeaiKEt9iG984OQVhlIqcOVphrBFEK2imDUumI+dDO/iJK9iW+BKdLv8qJb++arPaBYsM
	O8XRdpg28Nu4OfNojRdA49ccutjYIeWNLLKGtRFNcHpj4aobBPsqrGT7nAzPn37if5zCH
X-Gm-Gg: ATEYQzz5ikGSEIj5LgfBYI7Xi0dM30vztwooUqpMo2WXOA07HKUB5WyznYc1jwduM/O
	ZUTDTBejI004YtmSr9sUx7/Q0je5updSxabZpb+dqGkHTzc76jncLMcL5EoGjBR6fm6mptZ5wo7
	lmaU7ZIfS1AVzIdgFa81gzWcKXuJ8IuteSOJCtj6h0mOxgv3MRdPQfO4OWFb/e/VFTnbTsw2JNw
	l+xoACNzmnPraokKMqQ6OXw4CWhlnELTO4vVVMWYbECfWpHd9Brtd2R0YGuvK0KUj3Oo6hrCdaC
	Dw9ERSC7HEeam9TOBqX9THCM9nQVbqZipikI4dVhzPNdcMn9D3UtwnoHV4WXTK07si+skFOoh/I
	9vkh2IPht8CFTnNbwLk9YltZfIhg+pVRLypF/6GD/LWosr+er6ugC
X-Received: by 2002:a05:620a:4608:b0:8cb:4a3b:5e06 with SMTP id af79cd13be357-8cbc8e222c8mr1398997085a.67.1772467063391;
        Mon, 02 Mar 2026 07:57:43 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8cb:4a3b:5e06 with SMTP id af79cd13be357-8cbc8e222c8mr1398992885a.67.1772467062914;
        Mon, 02 Mar 2026 07:57:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:16 +0100
Subject: [PATCH RFC v11 03/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-3-4bf1f5db4802@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNlZG9LYSOKfu5TlTDseIe/TgDfGHUo+ed7K
 9LnJ2eJ032JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzZQAKCRAFnS7L/zaE
 wxShEACbtCvIVVakGFfkdp+go+XnzCkQJ2cVC+uPIiyIvG8vB0m5MYzgjVEEQuizT5Om48orKFO
 Dv9WnyBpd4u5lsgJCcef3LjQuOconyGuIZwzF56VlNnrHG4gRO3FrUMYaEpvDd/avaUZWvXV5Jq
 tRpDzMLe8+l+UfkbS2WJ8xyxBRaR5kqUwrCvzGzjb1V+3BqQR0p+ccdNX7hYBOXsVj3MYawfvf8
 0jYdBwK7B+ilI9Fev2ZkM6IZ495svAEWmEAlqwGn7LprjASLX8pyDX0MJml5ATSMx7W0arufyZS
 3QWunDUcsbD2Jt5g1XYNoE+S0yNDQCs+dTkVP6k0V3+idx2VwhvRuACHCAr8zpO9Ek+VrXGDcUD
 yD1ogpHf7riRlIPLmlnpKYf/wBUgq0P9oGuO58bNfLOqBmGrPzT2IAD0wvaQJ0i6kFqAr91Ip1e
 fcb8YuYR7DSDS46UbMKlzsHe8tAXX8O9H92eJEFvanCA9MbsjYQEAHCI6w3WVOtqJsHzDUh2mjP
 Dx8iMe0vezyl9gWvaradWUGc7T53RoVja9XHFD1UkBh70E9ElXDi6Lub5Ng+JJDs9VRMXS5TbvB
 cpnKz/UMqM9mG/gESnL+YgDvpA8aZt5/UZC/+0AWonxkMHfKY/ixMu2BhEVAesKwHYlP3DO+he8
 4c8t2NdUEFvtphw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: f_ZgDafNvX5-QAMkYjN9qabc4caCF3ra
X-Proofpoint-GUID: f_ZgDafNvX5-QAMkYjN9qabc4caCF3ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX9wxLacOy9V+Q
 QtAs+Vt4/cQO5gpxmnxFlsLoeiHvwD6AoPu5TRANMdit3Hwi9/NTy2MDrs72Fqm+WT+mMuw90NZ
 rE/uoOQpmrp+v32/7rViBjf3cabJbJzaO0HU0N+VKPmyadopHCcCCU4EXeTCendFrypRfLw1BBA
 dZBpIkpsgsmd2jAcOTkFyYFczcHbzX4+6M1fOEHYSN04lXT/ALK/LLHY8sSybYqCTYRaLWNjKHt
 ZwDQLGFY0TVXYA4+wHE32uE9cEUTMQ0rjlNJgJGZfWb9H0/uTVEha5R4V3QMPp/ADOKeeRCKkMW
 cIUi1bUbxABuSN4oEfINrLfo882MAd0rFRNsExx39cZIq3e3/dZYtLr6WzMhfiiFJvZ3lVOfKUA
 3+zGjnsCXMF2HKzb9tJILrnwxP7V0a4bBT8JLMxqVgFu7ey4Ll1ehcJkr9S/jNXgV+KRaZzlyaf
 ju7/UB1s29+3r3EU6qA==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a5b378 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-Rspamd-Queue-Id: EFA6B1DC5C0
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
	TAGGED_FROM(0.00)[bounces-94987-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email];
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

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


