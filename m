Return-Path: <linux-arm-msm+bounces-106899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJOKMFa5AWocjAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:11:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618650C842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 905E93025F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ACB366067;
	Mon, 11 May 2026 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4PJgDo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDaRh/ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1E364046
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497875; cv=none; b=qKQcodePjgMz9f/JSJ1us5a5vfxMZrp4392As4bMZU/72wjvf+Yx7HdSjHG3fszGIsAdO3Ea9KUFe/RwdUUVtQgJfrKuw9fe4mo6XvwXfdsNuleYqzMmob5dPLOhyaojckXCTK8N9AUiwk2zJ4CqKoAiSJImQ8GjfMYYmI7+vL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497875; c=relaxed/simple;
	bh=ixaIdq8s9sK/X9KuhLH5Xt/Pe3ZCxPqzdLBgPPRcCGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hj5OsN5TVS0DtPcfWpDBob6k2AVnm+RiOWyIOrYr6GC4AcamRYm6Rx/1I9IKbtrNC96392+4MxS07cye2aEJBKqivVHVl7SY1vwiVUI73PJYLZBv5n8nhl27D2R0dH5rNkwJIpqSeJamWWv2pdBSa9gA0kMiAiiH6DXpq4jKuS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4PJgDo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDaRh/ez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8Eh5R1358568
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6U2NCm6PjqK+2xwlJVZjMlcHV/JWJdYIbSn1GNodfVw=; b=P4PJgDo2Uhn4mh4n
	FLcJF6RN2rBlTrMQ0rlLB0IqaK3O9sM7GY7PQ0FiUnjwo739C0TxM+fgtkfmfVjf
	LMAgJxqGj2XQLDcq0RyhwxeQDE+JPnzlT5Rf53E0iDR7VE61gnxY5ozxD36apvgp
	iY+9bIANyf4vIahXNoUNTRiiNqxIxhFSCGKeuOfZ5IpNyfOXyJGVPA0ksIkEtlFr
	IUTv+2ehe2KsMx8bwlvjR5bAplpUz//MBWpHx+QDiZ3tT9Wt3Zw0TAwHlM0CuZKA
	ItvvQJsSw5d9O79lus/9/BwnefTrPzXAh4u/qrYPCULrZgNyXjZ6LJ88iz3PbQe7
	ufHyDg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4xtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:11:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57535a51589so403474e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497873; x=1779102673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6U2NCm6PjqK+2xwlJVZjMlcHV/JWJdYIbSn1GNodfVw=;
        b=GDaRh/ezip1EJE2k+oDqN0KD4iZQIDVkfE+HdSoIAJIOrg07Tz7uCk5VrgnWGx7+VV
         Y1nZqbfHjkweM8ZS/W7iVxT+YqYRhlsAAmR8ZAzXl7D2EPRSbFv3sG6mbvgOf5C0S5FM
         jr8/LcoSEGD0RcKveKb4N6ECbOuE0Do1WnlYwyyOGu/11M+0MXy/t+j9U194gu1rSdKr
         8dXaq+ZQ2EVB485yciTnb5MVOzKaFg7F1q/eu/CfspuenBUGhGeneqbYCWkL6albDkb7
         odd+c6RQYBbJhT0GXIJHyXCWG+WWal7G+EmqwCndrzkJZlR3F8ra+IbqQcYTNQ8OeN81
         bBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497873; x=1779102673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6U2NCm6PjqK+2xwlJVZjMlcHV/JWJdYIbSn1GNodfVw=;
        b=gr9mxRzt9t8jLN3tE+mnapXnIY0l6XOTbaei2yQVuxR0q4rorP/fFfI1Pt+UZfAC0a
         uYeTSB+vlTGuTTaHO8fKlYVXYYX5gR9ELMbRA9+ru0DnwE8C/voS7txlKltIl6E6Eqaj
         xp8i3MWzCRfhU/LefipLs2/Aaa0hLZqPFnVVE500LskPpqRY+4Oa8AMpQbBcqgN2tcdM
         9iIOfnwU3+d+Kicqzp2nVU1cN1x+IOQjovVWXFpYxsR13o3WJbnF3uJtl694mXht0o+B
         /zetGXxxQWhFluIpSX5HCQWC2uMZ1J5VT9QyzmKfDngGFzAruMr00lS1GVygT+yGGQf2
         HLXw==
X-Gm-Message-State: AOJu0Yxk0SdlZb72R5rhergXQ/4gDIZ1LFSj9LI9H4hdgWF8EPuC5bKV
	eoZIy8i88fqoYDMraDj9x6uDmtiHn5X3rhNcuzY4SDLyy4yTpgQKm/u56OIhN0n/YKfOb2OAM64
	NNEPoHkI8BwB95tcZd4OMehlOB83SFUwVbV5B05Spxk0TIRnm8PE+r4pjQ/Cv+5MZ6qYltDzcMr
	UY
X-Gm-Gg: Acq92OHzW6TQv/D69H01zN4bc6uhjiefqdKhWX8GVqgkTRUasCLy59Hwa60PU7p1gg0
	V4LkulC27wtrEz7EZzD4Dx8Mftp3AZjAuRFX2EjQ9ITh0ON8V/C5plI3Sn1635kWdF5xZQO7l6I
	J5+UlDxzZdC7T/Q++g/pMVBQ35wA5regCKB6GNlfNBwU5HGsr1FAEdDmZQmNmc5xnNc9Ijlp1Ck
	WrjjAnn6PPGTk7rf7hPGHas0Nu2kDOFstXQWD6Hh1pM2tTyHc2NLpLrmMnvBHsmYkyIgMXir2aR
	0OG9JjWXoOqhv3WRS5Xgd37018qDEZlPmdSO+aRoNRKZ+wSVSon9bpOUSzWKeCQFZ6bla91D8w0
	C6L+G8lYks7emfmN2HbmXetXJJJsam11/59h2OPprLfeog9Vu3bWQig0tD5EL8g/ujMAGXCDPqB
	RlNjk=
X-Received: by 2002:a05:6102:a12:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-63125ab9e94mr2488690137.5.1778497872886;
        Mon, 11 May 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:6102:a12:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-63125ab9e94mr2488680137.5.1778497872298;
        Mon, 11 May 2026 04:11:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcf44d53fa2sm173758366b.23.2026.05.11.04.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:11:11 -0700 (PDT)
Message-ID: <66d8dd2e-05f8-4f58-bfb4-fd290dde1ebe@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:11:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: codecs: lpass-wsa-macro: Use
 devm_clk_hw_register() for MCLK output
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
 <20260508113503.3550647-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508113503.3550647-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyNCBTYWx0ZWRfX+bRH1j95/Pu0
 FEDSxA+iyZZs63mjCiRICVBlzy8Uva0Ss/WS/tA9DIzYupMBvDlHln9NJznUaXnco895XpgGjE3
 gAB+KuNTqwLr1Z/Nbcw5B1Tfd7Bvo+dXCSF4fpCG2dASWIy0NlU9+JsYBl6JwpcAOobhXCM1ApW
 BPCVYWGL2AxDZ8zfLVxMyoPcGaFgQqn9+iuleBs+RUnnU0XQJH8Vw1NZSplc6pAqrid5xZaOIT3
 1ZZiEA59pJRAMZcZRwq3V++uRkHYrajfXxjC4MJHI6vdBQoIH6In/e/+od/1AWWvzkClmmAt22j
 5rmTnsFhWGvO5hdT3NgrYqrOqGcxkmIPpu3VVxKohIrd1vsPYhuWmqH+92i5+XRMs7OLSFKpd7I
 UC/Iy1UpLP8lyeCFviwQ55G8I2EsbyPRHQdCHikFPXNTMujQNgnf9yESas47wJj13pDs58K9FDN
 5cNDIw0DJ7hGMC7I24A==
X-Proofpoint-GUID: moB__MAajsO33Tea0s0fl2qTuYu4UNkC
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a01b951 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bpY43GGW-Kl_9GUVYIEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: moB__MAajsO33Tea0s0fl2qTuYu4UNkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110124
X-Rspamd-Queue-Id: 3618650C842
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106899-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:35 PM, Ajay Kumar Nandam wrote:
> The WSA macro driver registers the MCLK output clock using
> clk_hw_register(), but does not explicitly unregister it in the remove
> path or on probe failure.
> 
> Switch to devm_clk_hw_register() to make the registration resource-managed
> so the clk_hw is automatically unregistered when the device is unbound or
> probe fails. This avoids lifetime and cleanup issues and simplifies error
> handling.
> 
> No functional change intended.

This is a bit of a semantic argument, but the driver will now behave
differently, since as you explained above, .remove does not currently
unregister the clock (but devres will now do that)

> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

