Return-Path: <linux-arm-msm+bounces-91455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBtfOKR3gGne8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:08:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50CCA93F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24E7F302866B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8164B356A29;
	Mon,  2 Feb 2026 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bC3AVQki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu0+c0Ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53073563EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026560; cv=none; b=ElZTPPTxAIcRAzmq4XA+SJSal/UdvSOBpWqFAVnF7Gdv7YG1UA6IKStkOaDX6MsOGafQS1iDicHb231i69zJD0ywmOTx8eGgXCKa9WXLzP4T5KQZYHZSkEhSotsNINS0Yve1HGA5McIOybzgVw7+Aqy2lONZj7T0nA7IxQf1Jm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026560; c=relaxed/simple;
	bh=qIB2Lpv7TxKGpGiudH5ik8lNzRLl39d+O4FnkJ1I/Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWhXpR9Vj2cEZQihdLvW6QrFOrM3Bx+tHNXtaXS01wC9QJkJWEyGSQZZ9dXAqazzPn81YYCjE0JEdawqZE9T34x42ip5ACEyg4qu2LrgiBs7rcXtgsrBpE2Ph/jax7wVpM1KgAJAPr/RlJKTne73ylOvzGSkFDHCFT1EjfJSgSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bC3AVQki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu0+c0Ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284SlG454603
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3tkA7AYDqhBa/hYNHbDMd5f2
	xgn5W1OlVmL2DSrMQrI=; b=bC3AVQkiG1E6+VmbGlbkWeu4aNe1MpCPBBggMkNK
	xr+KFaazaqBZVd98V4/hyEOZEcthr0bawlLJCg7x84D1ECMg9iC3xLdG3msG51N/
	WmqBeXSbkqCFj2Ez9tqUuUOfdFMNIoe4HlNDCIqM70g0YmRfzRNVjJPHb/nX3hLK
	0W8nGv3QGWFNxYEt2K8toEOChsErdAWNaTCkJjg/iLrjOpHoJjC6ddxckLKIg+yL
	/SWgi+ZIbNg0bREe+d0LAcALEo45kKDdx3HmVGuw5b1c9MBhNpFUo8bIqAeERFHj
	+Y/nVuVNLwfznpunQV6sf6YlL+iJKDDrRmVN2IFxtQkKjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arecx22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:02:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so1081175385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026557; x=1770631357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3tkA7AYDqhBa/hYNHbDMd5f2xgn5W1OlVmL2DSrMQrI=;
        b=Gu0+c0Ok07gU8g5d3nzonGonhtjLWDoaOCw3gv0eBMPnM6znH7tsdvuh6PFx8UEH1o
         4HlXg+m77N4M0Db2jA1YQf9Z9lNtgOF3DH46vqk2C3mLQndxskhfuPha4W/veA5aF9uo
         bvA+uOchITa2t5+uWDWkWKpQqH7AyJbdAEsmq/dtzTITxZILTtifDjl9mF6dvwUFxmoT
         eIt0SzRTa9H/1BsE9nhANY6B1x9h3+tc5pzh0MjbwjiWakGcEu1nnZSOPxZOD9j5Hwb4
         OsPGxz29L1oNgBMIJ5h2vNSznrISmLfWWeu7EQuXpZCh2FHUSNrltOBYnpygJNX/EF3E
         T+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026557; x=1770631357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tkA7AYDqhBa/hYNHbDMd5f2xgn5W1OlVmL2DSrMQrI=;
        b=cBwVITkag5qNSNO1auZlSSt8bRQe6OO19zIifiZjiFHAZZFBtju2vD3KQaYSUP+sap
         K/Lz5PenuSqSQyHhr18vca6nRiykUK7T4Vo+hLdBnn4jEu/88xMM4GJOe3qEZavz3nRj
         aCSzj7A2Ut7YrpkbwYNNugtzHE8bkKujQ0PrsaIKH6U6h92N3UV5x2o68/onK49QTpAK
         fIW6GO0SHcfEf207Z9wJpD+BM6QAWigFvbtbW4bGWzfdhLb5SsdSzEEhU5uSxTav6/tz
         ATmZ4JpYh8JLnVWHjNlt29JME/ZhCxyBt0w23GqI4ixzrW4pirO9IQa+1U9Ni1TqLtfO
         XufQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIdPFGc+LcxzQZ2zUHNzfMBEEVTEsfxI26Yn9Xe3+iDcfTigZvRT+IPFaN+PPRlgdts6URpz52TB6rCzyl@vger.kernel.org
X-Gm-Message-State: AOJu0YylFZSrHXDQt7NCEBwjB4LDYGdUoi3fhHQnyKdZXVdvsapo7Anl
	ptmbxjPt4vchfu3eHW+jMzlVUHZhK2dK8CtceKJqnRGfmUax0JYOYwatienQ6RWBJ55WwzJTQwy
	KDzgiZPha9LB0zFvdd0sFHSPRduS2/FSXfjTojSmRhWucewd5fI0GZfHUwO5LjvsFfJS7
X-Gm-Gg: AZuq6aIDmC1eOoCoZR224CptM3z7mEHQ9qlnLOtNe1MuV13sUWGw0FHQbMVtcsA7f2P
	RsxvWqc64wX4pIDzPuuEAteYZQEFdU8FfLSqBWWziYIAbr0rbE7OahBFueFHKkt1J4tXxhUfg0i
	wGDtSCl2bsC3hOrl3dmlRSxg0JLL614PQCZEkI5+P/Mz6zt57uvPpN+6nnNjNYLMS1gWa9rZMSr
	3N8rXumnS0n3JhQ4QSGXWoIMjbV78fjIGp5ZTAILh4GPI+c8QFWMocjeZewWB7g6kBaTI7sHk9c
	4MM2qfVV7dWZPinOYDV43Y22I74vUFQFc6IK/5PRriOW0mHVUJlgDxH47Voa7pV0JJ0GqWGP6I4
	9Av9o+3ggxgV8uSc4toV+OUJ0
X-Received: by 2002:a05:620a:408d:b0:8c9:ea1c:f21e with SMTP id af79cd13be357-8c9eb21a77amr1378166785a.10.1770026556913;
        Mon, 02 Feb 2026 02:02:36 -0800 (PST)
X-Received: by 2002:a05:620a:408d:b0:8c9:ea1c:f21e with SMTP id af79cd13be357-8c9eb21a77amr1378161485a.10.1770026556388;
        Mon, 02 Feb 2026 02:02:36 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3bf18sm91797275e9.19.2026.02.02.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
Date: Mon, 2 Feb 2026 12:02:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Message-ID: <eorqoqkpz5veb4qgq5o6ll6zhocn7tedfxji3le2ex257v5n33@pou5m7evdl5n>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-6-d3ce4f61f030@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-milos-ufs-v2-6-d3ce4f61f030@fairphone.com>
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=6980763d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: XCyAwNcZtA4FuusFDvXpCAzj31odsR_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX//NKhUfu+qZv
 mk18m2dD6/xNTzQgvImnTi9BVbq+BCHGYmQBYWiV54RwYU3kL5NiukpVvNHyfq5kR3pCKJy4lbF
 lxIoI1H/IyXlFwvRk/sBaeImdUHIWk44xDjEL0ICF83sMn4xwqt5rbjG9W9fXfwIlr1D3hJZ4ca
 AWFbDJNbTxZDPBfWy2ogFHX/Nam+q5IwYH2K+riTdvv/0DgSqCUx1aWs2oGfbEO/k0Z+jmnhufX
 lCV3jG2/y761nPgXIcvIaYh9m9x7juBxAC2YoYmSd85N678+VODPOuAmWld1r4zlAWK7aMRM7Lr
 /qXnbq0gTv3p7SaIHPwC3/S+XPihy4uLnndz4mUUI2T1aI5nphyraf02nZ2UFODT71jMNbYr+KF
 axb4QMBrs8FBaQ4lWxZgsY65FkPBjrGGgaOmuHKWKigp8XDPcL5lA60gS9YaXyDbc/jRb9EV9KL
 tKfsUTqxMIMiKO7djAQ==
X-Proofpoint-ORIG-GUID: XCyAwNcZtA4FuusFDvXpCAzj31odsR_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91455-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B50CCA93F
X-Rspamd-Action: no action

On 26-01-12 14:53:19, Luca Weiss wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

