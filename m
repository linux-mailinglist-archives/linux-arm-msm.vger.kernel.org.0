Return-Path: <linux-arm-msm+bounces-106749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNrFAkBv/mnNqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:18:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 714364FCB23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9050A30A3942
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE603A641E;
	Fri,  8 May 2026 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6qo0eiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3ufiCwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953873B38AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282058; cv=none; b=H4PF1Ot+2P/Ef2rHMqZzhxDx1vsKOHqnMk8YS8qzWBN45CEX8B1vbPUaa4/CTtbeVljZdSAEmkWlOX9d3TQmdWJSaO7Sg98b8tmf7PMxOL05JC9czlCI/HDFEGpAP8tuIx/fOlHrmrgd6ztTvq5rh0EfgtBya3tVbnkLsRVsAEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282058; c=relaxed/simple;
	bh=YoASFUv8PzAeOkfxBtm2ueqBpPplOaTPeP65nBEl1AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qh15aVeZ8HiSHVtVvUWSL1xZKSQ7f7FXpAFl/Kjm8pPxet2KFOr3LSmiCijVxP0DUpwWxXKhQqu3l7YOMHAjtTm04/d4wMfowQ8SbDL6/BEvpfkK2tPmwC2dWRFL7SZNgbG+fY+tw4nVkICscG6+1IY/36zJFrnWpSg1KliBFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6qo0eiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3ufiCwe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HeeFs1662003
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rpPzXPNYRy4O6OFYiHX6DcpoAbonFgfwH5h+yYyQJs=; b=Y6qo0eiQeY5g6pef
	+lrLTf1w8ZhQKsjUzkdpmSdHdPeydG9wD4HeuQAwfKCCgH6CqAhEyaaQ10FGNzZi
	nZzfiP3CV0fsOVQ9BYp6Ytxhno1AzH4LIa0OA425CxEfdcPTaVt/bd9QSy3CpXih
	tzdxe7YJFnK9KOjPAzQSjkRXhUTsw73ad/qtn/zczYpzt3X7LeDSTVV8XXzB2NmF
	rO4FOmMzAuFqjB/aAKrIDSkf2SuTpHdglTi6N2TH1x3peciO+hCzSQystpyZywdM
	DS4pqq3AebQbL4Xx4h3E13AL54rviBNY+j5WbyvVUE1YzCMyQsK0TQBzEJMoh9K9
	Ka5kUw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men0wup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:14:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so190941eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778282055; x=1778886855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rpPzXPNYRy4O6OFYiHX6DcpoAbonFgfwH5h+yYyQJs=;
        b=D3ufiCwePkW8O/i3JE+NUgx2k8aVw0Nbte/FRjkUAgKsaL1AT6AGRsJdvNx7hgVELa
         5UMRfE5hDUljHg6Fxua2JswGB5RjTgPmXk2JTG58PPBT5ZJYY5AKvm6gC8cVC+AAJADo
         3rFJxLo1/OwqNb8lkV4vJOv9dS5hDyChezYhnvWl/XF4jmTCEmDAO8/6HksBAw3hjjM8
         WomA2ZxG8fbe29BXFG9zwLmu4xcPAZmz23UanuhPD1HezcPWL+vEy6fylwDKIaW5qrAl
         w+mRcLyFxaGMwrLAgR0GosMX2g9dxsB5x7A93gOppwt6s20c5ApHPzpGkbEMKyNDH9hM
         bTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778282055; x=1778886855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rpPzXPNYRy4O6OFYiHX6DcpoAbonFgfwH5h+yYyQJs=;
        b=nIITxK12KRk3K3N6NrSnA4WRP3OW9o8l0fzbJ8mh+sFkuy33YihHjyUSjUL10ig211
         Wc+hF90vs10cs4QtM8mr9q//F+Tc/lVtoh2hWoLv7nYaeG2WlUCmaqc8lne7Q6Ss+TC7
         OoF9qnxE793NkH9xlGAnnB679gJpLM1dSTSnSwTnmBUnUGS13mrJdGbjmDtSjKNeisN0
         5MtIMDqJnk11jwcolpP8OyokfjKYyfQaSY8mDIsxgiY37SRepr9QOKBWrMnZZSbdcxJZ
         Jlqz6gdyQP/QUMy+LGHl6AXMm7RSd/F7DGX3c2Ttqh1mIN5XiOTYU7qYgTRhwc27RBz5
         MgHg==
X-Forwarded-Encrypted: i=1; AFNElJ/zTUY8flMslN9ICpaSJe67uZ8izuI9agx1R+XOjdpZrgfLng9idyS8mHaiYoD+DrwHbVGfKgKMsP8jcgzK@vger.kernel.org
X-Gm-Message-State: AOJu0YxoaBo88K5PiY/+KCiE/g+b/p0gtJmaWKK240UukKyQvQReaaWe
	CMggANXqHPl+4ZoJXtuvWhAix/aUtYhZWB1giVWd+NqO0eC9cE2zVurqWDXqre237HRLbU9VIXJ
	UjWtjNYV0vqyygMevQZg7OC34oEr4xJKe/+Vnr9OwDtsdj75dMGA9urmevbMghFqWmXzI
X-Gm-Gg: Acq92OGspErRf2iVYzwNCY79sSwEJfErBDzYB+3DX/iIRbyoUT4diMPoXWuc/sHc25f
	W1ee8/c2BLsmo3khbRGr8pNZ8XjpsfzSRx88NspiceGf16uzNctFpQgupRwRb+UubXgoqnYO7Or
	vPaXxYBf+i3+g7LoWQHn2lSRHb6j2u/8uHUDMG/lM7EupwAc0gDc7OrkLbYhHyZZSoF2RWZvlOt
	z2cB8VYG056HXzZMmACzFzJRAQQV3wtrSAKTu+ji2T3Rf6phT3mXQczi8C+VoioWaoDya2CVdWj
	UNEHpizNNiII+xPgZMtuBo5aY5DyjPHYa3IxMaikqSFuNUxoBSGkEmRbfcQJc92eqcX13YOyfVq
	32gKDcwFQd2i7Mb9h1uZ7Cg1E+qeFtmr/v/H6V7T4WDOAMlHnDw6t522bUHxOH4Wj8UPNR10n2g
	==
X-Received: by 2002:a05:7300:dc04:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2f54b79a394mr8012792eec.29.1778282054598;
        Fri, 08 May 2026 16:14:14 -0700 (PDT)
X-Received: by 2002:a05:7300:dc04:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2f54b79a394mr8012771eec.29.1778282054018;
        Fri, 08 May 2026 16:14:14 -0700 (PDT)
Received: from [10.73.236.40] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b820sm4124537eec.20.2026.05.08.16.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 16:14:13 -0700 (PDT)
Message-ID: <e37f2d5d-daa9-4302-8d34-9ce198e60a4a@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:14:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Mark Brown <broonie@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
 <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
 <af3spostNgoRU0Vv@sirena.co.uk>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <af3spostNgoRU0Vv@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIyOSBTYWx0ZWRfXz1gJ47YLwKYJ
 wZ3WsJ9lZAJSATeBKxUmNXiVPolYI0C56+PJFcCD9k+1H/u+MwXSokhp4W87Z5uxQ1e9gm/fXu0
 xs+jcLdp5GS14YD3RLcyVGziNHfs9hiPBMPI6e9dAcwH6jn/IZNFGLc1hrlzi9bo1RFgU/UZKK7
 gJ+PLgXL7H9A8fRLLuQ3mYpUEz0fWG+6dkiQn++EsUV8HYRQJ0fohB4ZTx2EcStML90sa979t+L
 1f1SHMn+3NgxbgZcaoQopfpc9NO4AlfMGtUad5OlfC5R9eqbnraSvDMs2JGGEy3Rresz16DPdjr
 pSXcHqoP/opwul6pt1w7pph0yR+CcmS4x9BEdguoPVATRDvpYezM7Aun0EujE33FJsFTecPVbu0
 1+uAUPfQaXtCBYI7I0sEhSmtfJ17ih4Y/fWW1xuqarJKRpYF1v8zP9sB60XBsNh2YsntcRSKH7P
 QJA+T6net9i+x4nxT9A==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe6e47 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=V8Nljz4Om1l1OIjE0acA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: qMh_nYiHpa0kukGJsmH37rzZ8TgupOcu
X-Proofpoint-GUID: qMh_nYiHpa0kukGJsmH37rzZ8TgupOcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080229
X-Rspamd-Queue-Id: 714364FCB23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/2026 7:01 AM, Mark Brown wrote:
> On Thu, May 07, 2026 at 11:03:39PM +0530, Praveen Talari wrote:
>> On 07-05-2026 13:43, Mark Brown wrote:
> 
>>> By generic I mean this should not be driver specific at all.
> 
>> I hope these changes are fine. Please let me know if you have any concerns
>> or feedback.
> 
> The data tracepoints look plausible but I would expect them to be
> generated by the core, they'll be there for everything so I'd expect
> them to work for everything.

I agree here. Praveen - this is similar to suggestion I had for the i2c
internally. 

---Trilok Soni


