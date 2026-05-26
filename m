Return-Path: <linux-arm-msm+bounces-109825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNJmApufFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:26:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B25D670F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CDE93201C5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3AF3FE660;
	Tue, 26 May 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqYUa6mT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iD/OJ0US"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3923F7A93
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801103; cv=none; b=cw/BDUgydVcRATiL/ylmNOZ5GAdDAzzN0Byq/UTy1sw4cdKC17NK3fkKb72qwyFxuW0vUBPt46n/uhQBYl3KbsoxMj/5gL/+X7Wtim9sEKZJsdgk9zkR6lrmf5lF7sbS4RcpKMDNi5ZtRmwtdjPD+PMjcyYgyZlcwagru3tsl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801103; c=relaxed/simple;
	bh=3yBeQNw3jzjlpjDFEUCe3Cu5wMqOMdw6j0aFa7VZxZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBqz2dnBkP9a+SdRqQrrf473km/hpod8E4yNMPC0pPMRwx7CfsS/Pmq1HAtIeIALBXnhFv2cvAyvNDsi05W1R49QFek55SD/elIKsFq8dNnRwpTI6MOKJLZAVsrehN5UlHSfcR9nsVALWGa0CxFbedrf31Bmc8ri+Zfp9tTFdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqYUa6mT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iD/OJ0US; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsPTO2697734
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=KqYUa6mTTSgPnUTR
	20g51nTNeQXj4UzVjRjy7WRvAqxGgl82Mp2i5WEY/SFtnnSeH3pPgHb3n1dQskGx
	qrZS6M2elC/tRdtVD4Pgg8aV1tFNg6AOoqsKFJNbIPcoC/h8GoSN4LXyvavWEtWn
	c4sKAK2VMfVQkxbsy1bWI+/GDVD9ETQkHte1i6AU6PQ5Sv5JLIoRcRXTpnsmKeKu
	iunrnarMQa2Aml8Ruvcbew1jFsD4B+A2H9u++UBTPFQtMsHKUdTjOvAi3MLzEasx
	kADyzFbdABQjlfrn0S7usz+gPdW8n2zH7sVwS/HWtJmCqvo1gfYguYNe49QjrF9L
	vybwtg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm03u94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6798c46f723so2048141137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801100; x=1780405900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=iD/OJ0USlviM/FD4DGZI1jliNSGSgcPdvHDSnts6EpA0wQJ/RIHhbcxOHjYX/4dLlR
         zabv6DvFJP9vW07Xadle+3sJXgTIko+2rneqSAgWit7HYigj8TpTlqsd/bQ8ov7Z24GI
         4+sMeTNvppNxlEX9gushRWBiGabwgCpKyG2l+id6BnekB+yc4Bify+N44CzMeErRy4ga
         2EV6dCYF0jgOFF+521GgzxT7Iuxh8FKqfn5z38uylEFaYjBSn7IWoq7kd79ZjDj5iV4d
         NUz09giT2L66wdyHbT58JuijdNZM0OQobX/Op1woM+ChRnsKcg2SJjc4UankMoe/zu4E
         RalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801100; x=1780405900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=jHXxQ2cuVauNr/D7OkSkmLBlTF8c+NopQ3vPpHKbEpA6VDNnEnsqs5GZAE2rtK55OV
         OPBEpOkFgCX4zXleRbJZ1cWW2gxsQbhiUalNfaG6KIlPtAdzrk1MGbkVhfk3HQK++Unp
         cy/0x7XzAQsLGy/XbUA8r5nqZ7vk7dT+fkiTut/3NuhN/z5mvmJ175SulegKTU3Z6Xge
         3tKG4hRnjSO2+JwcLtwj5SY2QfV3jzl2lHzp+hQ0h94I8ZHxBDeXZYTQ8JFF2n08g3NX
         jArHNAvDCfU/ZSx+is7HeQHEQT69GXL5Sgs8qRBFdklBYXIF4Fhv+ubh8s/QeqTip3+u
         7xQg==
X-Forwarded-Encrypted: i=1; AFNElJ8sPFBz8aErXj1DRgLBroNgLmBXgs0fI5/Vh2cGW0ay27gYzHL7kP/citqM3jH/TyiASHwzV/p0N1zh3m59@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNUY8Tl4hS8JD9/vWjnTSH0lKQhRol280u6UvAxytxelTuTfD
	2SoNmnJV3TtTzAN0ur6PYV17JXmd7V7W5CzkNyfvDGs1NkGkcvtNE6RI9hyuKW2lzOW6Dsd1Ty6
	IFdM5p6XMfTjpmuY1ICV+sYNXqR84OOiudBxHht4kTUFXTrt1PDwAe2GtEt3OIFR1DbVs
X-Gm-Gg: Acq92OGemGtDy6Yygwo1r3tVKVgT53tLlRAmqebGl9jZ8lMTuM+2fwzo5FkyHuvnzyh
	ubVvPoeANlYJDyR7Q4+uiLnTypSlDG9C/AO3SgoDLCE0CaVZVSlDDY9ZQL7TRMe69+gKKZLR9J6
	m22H+aPRRvun979Oc9OOx8Hfl9MW+AryciFrH4ht1mRPhoU4b50I0ChCJlBXPs7T8rRghl5BBo/
	HpQqergnSaiTZ+MiER9hlX+Z9VUIMKwRuat0CqwKxdZacAeILi+2CQyIxTJ73J3KUGIA9GAE/Ef
	rkFmjX/U1Oe7wRGgEV0s+6PZgJk1v/1I0JsTxFdhPbQw7we6HdbiFY1+FKu3oa6jQzgqLnzDv3u
	+/0l+oxBy6/1CH7BTYPHbuIIsjDiCAMo+ZcjQkOKIdYuNLssER2U=
X-Received: by 2002:a05:6102:4b1c:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-67c6f273741mr9659081137.2.1779801099550;
        Tue, 26 May 2026 06:11:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b1c:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-67c6f273741mr9658983137.2.1779801099018;
        Tue, 26 May 2026 06:11:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:58 +0200
Subject: [PATCH v19 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-10-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fDLeS2ZDhx+ScijOniaw6DzPwcx1IpnjO8zSFEJey9c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvxilieZXxkagFS4yLDPqAHVk/2laQMRGU/g
 N/8pGfoF2aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8QAKCRAFnS7L/zaE
 w1e9D/4yXaFoTfncd6ZGr2f5H5IwaviF/8Xp0SUigtSjDqiB7yFSXFG7EZUn8o5s28BYClwxudc
 te4aq3DoYC2qQE9nczH6XmpHsf3xwIHrF3ybG0+SL1QU3yvnhvSVsGSyvdBjcxCIxclKddqYiuY
 Jqczy2O3H5so62llaWaPo9CGbLWkNJE8xEdvxsZZt2x8zfIrATUsGkI4ZNI0QbI39IxsRX8ysz+
 AyHWXgQbuc6MS5GPNs3P5E18euzP/9FAVlNpu8+BSgSk7AweGjmHaaWxCgYTaDSnF1Kz545bN1c
 vQqCKdN8oqVOsj8Wk4J/6TNsVZ+csDl+L4hq3zvTIRg2PZAT0hV/Cqte3NaipZ51wgnOwAsW1UG
 IQgNkQwmeXEr4hSm792Q6q4oh5I+yYY1xHT4dueYAiyK0sZnrc0nbI/ToduD2nY+YCo5LaCgxs3
 ohaWaUgxU1MZ2soGSdmDbWuA+bjHkO3FvduEDawZ/1/umnZ4JCsBkewabiSswk7WHysQ6tA4xv4
 Vkk5yHwBZIeF2Ai0pQX9vJVQ0Ns0PmTNe8fjCfBufT+uOZZ1+Vo4SYUDgAOEDXi5MjY3+Q2lun/
 XRUE31Ob1aG7VwQ9HygD9lGsO4y0erkc+HtLBUbm27WdSAsf+rSIsOAt/WBPksEk2rIELnlnUCt
 3VGTavLE3wbVyPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a159c0c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CiDan6Mm53iAPDFqR8N1epBTURkPJg4H
X-Proofpoint-ORIG-GUID: CiDan6Mm53iAPDFqR8N1epBTURkPJg4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX3nCPBSbJKK2T
 qZSWy4twEbzO4RmWJ2gxAtGsl0WLAD7hZ0I8lfIVXr9kbiCxsjpRv4MS2XM4ot/JVpiD4ghxiAf
 +eLlLTRE/LHEJ8lM4SUQ97/tBDTtZRgkomj18tYyHRQqJ5AtpCtPa34Oh4RQt8NHnq/kHrCFJoj
 oUEqTAeI8u9g32X8RDpuo6TQjX4OhWrZbCPVnG9A2kgpjTx8jVjGIW3FeW1ZlDG5sb3MYerijJj
 zqrjndkNik7t2Af6ChTeS6kXK1N+yZX8v+ofhruF8NEJ4I7MmMmaBsMHBrT/HSuO6tm/12L2T1e
 ZIjfl3qDbkZh9+XI1dbcTurfiFe1gwmEY+yvJvKlmrHY621qT0OZAcNQXkgdzCTEP9J+w1ENOj1
 dLfx2rES92c60J4J5EnK6d/Tg2lmSQHU+8lF7s5c2nr41EjgHYucT7kyKAHe0JCYXy1S5pQt/sy
 mBS/JIuyi+XUMLCj3pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109825-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E84B25D670F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ad37c2b8ae53a373bb248aff06c3b7946e8439a8..a0e2eadc3afd5f83e46724c8bc3e3690146b86ba 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -238,7 +238,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
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


