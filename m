Return-Path: <linux-arm-msm+bounces-100381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJpCM+a1xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:52:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58746347DE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 040A3310CDFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477B134B1BE;
	Fri, 27 Mar 2026 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjV/DUfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="es6wYUXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A932FF170
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629998; cv=none; b=W1sslAa3qy91Oe8wWF0uuOhiGS1qDuHZPDbTAhrMMt1e3Dy65LEQJcpvjtsF5iLzm/4X6Y49KVm1t4Q/J5jwz/SUggXO+jV9KTCmfMoLH3L1C2AL2iTzJk7qqQUNXCRlopiAyV3r9y5bBFbJaeXwQfzftHP4WKV+IilTEA/3WSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629998; c=relaxed/simple;
	bh=35J5lLfOgD/4GcuQkstfjoWjV8imDeGgBQw7+Ivt0PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqKXIi23dMCDPlhMQJt5coOxNgtNQJVmgECvVaWXOsrwizUv5HuYNiiSF7F9hdObf12Uz1VlNRYneNoDoYg0BJ8M095JQQkfhBekFjD0nLQIv4f06JIAWjPl8Z020fm/8hJEjafEVPMnMBZrIzmUIaZ+zqMEhnwG79tNt0fbNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjV/DUfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es6wYUXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhK9u881709
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/my+npTTxhyEzTWA8+2uihSbKgAQuOqTr8zXpMPeT4=; b=bjV/DUfKP2ZU+K08
	w7n6PD/kEdxrfwtjNSNV8WbTwu7/fPdldnlMaWOxkONCM+1pD1jwvdv1Rrv4TRuo
	B7GGvbw2Tg4HN7xajQKOFTlpcf8DVsPIdpWOFZuI8A+ehewU2I2WvlSjBMdC93hW
	eUv+M9nMY2fhp7q/7+KzyaEC8Ge4MhP5iL2CgkzeZYH8wJ6gn6npMvYsfSVvEr+s
	SL7HvDAuZT6OsLzHur0JkgndoJd1C5pRPQikCWET9q7i416EVeUxnC6puaV1Ozg2
	Z6ACvwQXj6HqrjzJaC6Q9sno7uzg0EIRLI7C4GJRTcVQzCjMbN03PhFvhmzPsPUd
	Y8YtzQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6km09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:46:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so2199674eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774629995; x=1775234795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/my+npTTxhyEzTWA8+2uihSbKgAQuOqTr8zXpMPeT4=;
        b=es6wYUXizx+mBmioR4mAP9m8WbzTRTY78hoAuwlX6NgtddZCiP/jFMN4l/bRrCUHAz
         4IogYk0qTJC1wXqmYe+tAVTR9YZhFmiCLZT20asx8CDIsiVL9VeAinQ0gHsZALfMhNi2
         uBam0FWvOJoZ6SaOcHBKKVOPbHd93IkWUG8yMPxJkv+q32oCfZ4ujcuo+YiuUucdGSzW
         kAj8YwoUg1AtznhFdSjLs2n+nsWBE3MHM19xgxn7qt0LTyQtTweczAn4H4B6pNSoJ3yz
         hP2oNXWynyAYitko2FUJSkl0PN8PQPb4gfJQ5nnRyT6nqHWASpIKIb0+pbGN3QnbPpSL
         36PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629995; x=1775234795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/my+npTTxhyEzTWA8+2uihSbKgAQuOqTr8zXpMPeT4=;
        b=Qp3FTTSSBt7cyzAH1vE/TjnKpGOUhrutiitEdCh9+JHqmObaQ6nLJrVeZFLZWI5BkF
         m8EpPs+h7BqrR0M9A0pmARrBJNzmAwccKOkTXIEOyiAtU7ZppXh6Gm/7J+cFHae2fdnz
         lXUmVaRr4hiTCM9f9dll0YkWsDMIci9OYmxz9OOWb5dx5VBBIggaeRInMJVyaQDrb3Pb
         5bPxv/qWhiqcJ4vddrc/1y4rGm2+4io0m41422wRk5G3+6TUa94iBUqq+8pZBuH/DKRA
         v9cFU+YUpRKK7AHgP2gMeU4MaOZzvi53qbDreariJ9amva/n1xsBbC9UBKJmBsKwJU8O
         dCXA==
X-Forwarded-Encrypted: i=1; AJvYcCVoTHDUXsOsicNx6nLUvXnwlLHak9BCKWNvNMrayc7xDBCdLwDefpyCDKjR5Y4fPT4vfK9x/kfM3BsKkXrw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Pd3tcHWOMXVddGbJbFnnHB2zScCFZSLfpmUMt+DP0wCdlNAQ
	ONjp+VTB31RlvqCsX49166CUlVG754JNAlfN4iIQUeNN5SgZ/xcH+vww3OBKjouaH259Xc4QUl0
	s3HKSI3YJrrDLbLOYVWyZjLTiAYZXIyWcUimiXZO8XtdNxrKxOuMU1cAPtZCjR5YWyJ9c
X-Gm-Gg: ATEYQzxAWWh3sk/T5oSKqi3SwV3NFCMpsDwvwEiOmacy6ThWFDCOCEgiwfUAPFiG34p
	F3G0VecZrP2sTwQcJfFVKW4StlZVHhYsnaoT8x0cPhsgVLU/iqnqSLGnU5kPFZu4grLPYCc4Xx7
	dpOdIaOCEyF5T1VBbsGSLZpWRA2jFu7lEMBG4zSqbk3huYaqlaSCC6CZG79OLHRbrOrBjAatg+0
	IEh8OLOqf0qPczau9F+A98ysZHUH1is7VQ8DcqZUGDelMoIzvEygN0iAQk4jgc3yU2YraLG2HIg
	TN84cDEU6h7uJnSpzO5HX36P0JNIkuwSTpA9EHgTh176Vn5or66sfgjsH6rWkAJ7zKeHNOtu6dd
	K7aDH4Qpp2IvwXJyioYOOoC3O0vLNtSFQAf/WSuWzw3mJMKgMvGEoBtlJ9OTslRePTLtvcR66ao
	Y=
X-Received: by 2002:a05:7301:169b:b0:2c0:f15a:ecbc with SMTP id 5a478bee46e88-2c185f5e8d2mr1571562eec.33.1774629994801;
        Fri, 27 Mar 2026 09:46:34 -0700 (PDT)
X-Received: by 2002:a05:7301:169b:b0:2c0:f15a:ecbc with SMTP id 5a478bee46e88-2c185f5e8d2mr1571535eec.33.1774629994253;
        Fri, 27 Mar 2026 09:46:34 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec47293sm5525109eec.9.2026.03.27.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:46:33 -0700 (PDT)
Message-ID: <eaa32b67-53c4-4194-af33-fb83623c6f0f@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:46:32 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Handle DBC deactivation if the owner went
 away
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6b46b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TB8fjEhHHLHokerti4YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gJKMEq4TMYB4zDWvL_phGUg11Bnz9NNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExNiBTYWx0ZWRfX1/B/6rs9w1gb
 gnYdSmtGX6CCFx1FO4QtKET/tGrzU6srelUrjP6IlZUtjE9s8ndTKgCLTCVHzB2HbVJuSaH59j9
 kyQT/o+ujVL78bW7mC3QHwMqKR2fGjm55m/YD/J66T9kwTPmyj7Fo+P25YnDMidQaSs1E1KLKJT
 kpjPB251YxbxeYTRbTEKC+Q9LLR0/CvUyA3Y+Dx1z5eDdr2fXxtxtt7Xvj+pEJFY8xzelfx9KRC
 gFlMjOsjpQx88rb0RmT8dJS2/woNLbRx3ucCG7kfcnm34Wz36wSVRhQEVxY5rjbZFfjgOMp5Xuw
 EZfTToZxw8c4AmWE0w297WOQ2jR8loDqLQYeR5MTfD7B0V6lC6rAvzc24Dx0dFHohbIQ5paJhw8
 /pze5bLWA2+68X5nkO76VRxRei2Yzg1/GgCWLg9u/hSgc9DQTTdGOHxcD/E9pT8LskE2imsSn+q
 sjNEC19znTmhQDydiUA==
X-Proofpoint-ORIG-GUID: gJKMEq4TMYB4zDWvL_phGUg11Bnz9NNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100381-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58746347DE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/5/2026 5:34 AM, Youssef Samir wrote:
> When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
> transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
> this by calling decode_deactivate() to release the resources allocated for
> that DBC. Since that handling is done in the qaic_manage_ioctl() context,
> if the user goes away before receiving and handling the deactivation, the
> host will be out-of-sync with the DBCs available for use, and the DBC
> resources will not be freed unless the device is removed. If another user
> loads and requests to activate a network, then the device assigns the same
> DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
> leading the user process to hang.
> 
> As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
> that are received after the user has gone away.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

