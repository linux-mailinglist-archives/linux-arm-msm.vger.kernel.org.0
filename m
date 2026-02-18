Return-Path: <linux-arm-msm+bounces-93313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGEGEj/+lWkDYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:00:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F1158754
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21C81300E5D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC6B314D2D;
	Wed, 18 Feb 2026 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkXkkUXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnWCp06r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32267327C07
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437628; cv=none; b=JacQ1wdzbF+GI3fK9UIP9RQhUQ8mjxuaOITM2zd3POoBu/AND33BsBbvkC8rWOc+xS0yFdYFfZh5dDSRY/RDJEHCLheMIJ4R36lYKalCmtKecf5j4tYaIL6cAas9X/m3y0C0QxovdGZOvdWFpuwbMTCTVcRZ/gjElUorBztn7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437628; c=relaxed/simple;
	bh=Diw1gjudoUUpgXc12VDDK6rvyfujDuJrptvUlV7zhOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsmbZA1N+en3gQZZO9E/nBjtFQgvlAguYea/oHWiTN9kUSpjabZ8q8X5TByuzAijijYLAhjNXPcMz2ZEia97TEAdox//gadoMyv3bg8O8aVowu2lmH4OZUiuorc1tRFs4TEaIKLF4gUEXP45EZDEcG4lXb9qUYTTEdqsuSCAV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkXkkUXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnWCp06r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IFeZOD421067
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=; b=MkXkkUXEWW/YoLul
	fLyS6tzl1qWnX+rPDYn2snJDzmzNC1SAaR0FvubdOJTfpa7lee+JOrHHSCgx32h2
	qEy7VTfVtTwyX7pS8qdKu/YjUo56NhRHZz88gZrv8pGHc95Imuq/hB6pfVd6NkNE
	0ENAUI9r0tb7PBeTQMeu9bd/QA6cwVzoP5Cm2lcTN/65I8ceQ2u27DYYSk0uTN7K
	FnAKP0MLc+hWD7ZYxv2R0T63M6ngpkJiJlL5Kj1VnKoxvTC20KqWuX+DWWdPFX2U
	uR0SOpA1fHF23v9bzdieZ6rBeEYTFK30Zd6fnff6C7SUoi8lqDvQuzawZbbdSjdW
	miEcNg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e1y9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:00:26 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4502a80d0so2023031a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771437626; x=1772042426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=;
        b=gnWCp06rKKmAmyt+fs2Eoaspfle8y9hPrhuUbGxlqGbUcI4+t9RtElI0WB0xpq3+ZP
         Pe0AfhMJiY5UJ4E6jRzFS4p4lyeop/7iqBYbGgnbBMZQI8ceiPQqcm0RC94i9ZBKmhzf
         XF7/Xf18rYyZ6M/s8SmNPFbayHyCQOa7jnWQAj39h9sY76Ipscmdoi4RJAmMyliQVny/
         qV79DoYKJjhoeBAOtxIS4GK/doQQ0G1j0AbLXW/QxWvUevNmsKV19eFuKVtASVRHUsPl
         gj5sluHkMbAIpMymr8lymv8YaakrXrXqUGzdPzUIcJKWdMaxXNDBPbsEEWDAsVXzL32p
         rbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437626; x=1772042426;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=;
        b=jf9oC11972l9ESfw8IRmwdKK/S3DVK/nuU7ZXsDxIPjywrmzNj4BYKr8V3aN30g6Si
         z7i9gBylJzsYYD2e6G+AkWOE+nVbLr1ykhr70lx+InLxmn1Mf6J3+sQxWONNjHeXU8Pc
         vkKP/Qp6dj250K8dgOyEQ1hUjcUB5S0iOQ0ihvNvuNjrOPJOdFe9zFtgQIjlMrYHpqSA
         vIBxuP3xsq5vmDuSjvJ1AP7oMAP+XVlc+09VPMNunx5KzYkKaKBdvWQo46NAZ8sALFGB
         15ZamtuBOcJNRyagSEAIGjkaGgPkM2de39NHuxu9oFYce1UG6Wf1HG/gpBmKWIt7jbSV
         F+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUggZEPrVko8hFoy3HaCwHkD3lEh2xvyJgxjs3oRMmEtAljS9G1BZF2zxzsNWswpxlKsxYQ7ZN8GsO0bfzO@vger.kernel.org
X-Gm-Message-State: AOJu0YxqcTNr2wnSLd1AA0vQG4ybWE7ZW2TWZpbCNxUf90zPeKpss1Mi
	H7rPRTRt903CXx+/pvxkSV5m0HSklIixmljALaedIj9eRY+MW5WVRODbFqQ5yw9Y75SlsQIdh76
	l8p944C1E0dmiZQ+qWnZo0we941KWoHxr4axGgZFMn0UZceJJ8U2dqb4DmmbQmyhd4nU/
X-Gm-Gg: AZuq6aIiuSksIRCvD6VtrAYZzVx8tvk0wnvvF+qKtGE8S+L0M5gydhcKb2YzJtGCuXu
	bGonNGnMRRl+f8BmUtjR0iUCeOB5XlNvT7Kc/y6zmURvfG81/QSePdbiHcFzD/chX9Y4HFz1kq/
	tLhyU5GforrvJuNbqXnF/fpgLttPWVhCfNnz6dOCRvwqJL1/vVYgbiKeajrZqRCqVV8enr8x8Jt
	xxSbpGL0uUs9ZXxDSNbGEMqjlAsyu+ubpS8aKTNYXdYI6viUAi8K7TuPxgQuxCx1sXKjDxrBBGr
	00nwE17BduBsQn4uO24e8Fl31u/2HQ8xS5BXDBy1mvN0nuzaWDtlIHhE5N73TUE570Rm/0zNx8K
	NIT2v+Z70UN+AkrC0ae8EJdjEhFMwg5hx/pK5A0nH3TG5KbCYDPfMvf6R1dmmHx236jESjn1L98
	nMzZfyWw==
X-Received: by 2002:a05:6830:dca:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d5127d2d67mr105908a34.14.1771437625509;
        Wed, 18 Feb 2026 10:00:25 -0800 (PST)
X-Received: by 2002:a05:6830:dca:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d5127d2d67mr105892a34.14.1771437625085;
        Wed, 18 Feb 2026 10:00:25 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a754b4bbsm17960110a34.11.2026.02.18.10.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:00:24 -0800 (PST)
Message-ID: <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 10:00:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
To: Bjorn Andersson <andersson@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6995fe3a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=vZmAtJSpd1NQ6jeXC_kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MyBTYWx0ZWRfXzrsx/GkUw0Yd
 85DWcgOachqhVxp74RfP6pYqJhsAXl8H6ONdpp4dGa915zIiYQGIFOaqQmsf4nqb/lXk4Bnsm4a
 deNaXyZL5/ZyXu3QcmgZ802EPV12RlqdpgOBD6uzYWJRyfY6pG09AuJXQD0WEfDE2xOTvIQYE1j
 PZXBWALhZBYpqBT4x6e+Sin84iCHc2D9+RL29Y8JytPfVG6Boe+AbOj/HPwWGtQP0JI2DouTLYo
 mA7ZK3+E3nvD3sJuVDMHGJtffBVoanmjvRqmdAWRzsPcvnoi+E8Qi5loBhEWV1wNVoe61MY9kbz
 2AzW9aZNhYhhZN0gB24drz+7KTXy6lSSVqaHkSBeLYKBBoToin/sLSzoZL6ZfCirlSPkQZKf4W2
 QIRL1Ryqcsz7bTlHyj5QrXQcNMXUQVCykcOAmuFaYRCHU+pRcm8Ik8388JNpsHen/o21D/vUu49
 9UnWT/P9QLAmj6WC2pA==
X-Proofpoint-GUID: BwUnkxE-QlyrZj1BPEFeaDbLkK3HKFgt
X-Proofpoint-ORIG-GUID: BwUnkxE-QlyrZj1BPEFeaDbLkK3HKFgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93313-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A27F1158754
X-Rspamd-Action: no action

On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> It might very well be that the underlying bug is my expectation that
> elem_size should be reflected in the struct and not only in the encoded
> message, and hence what I wrote in https://github.com/linux-msm/qmic.
> Perhaps the length-specifier of an array should always be u32?
> 
> @Chris, what does the downstream generator produce here?

Is this behavior just constrained to QMI_DATA_LEN TLVs?

I'm looking at downstream Android WLAN code and it has the same discrepancy,
so it appears the code generator is always producing a u32 member in the host
struct to hold a QMI_DATA_LEN member even though the actual element size as
defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).

Does this issue get fixed if we change the member in the host struct, i.e. for
the issue mentioned (that I chopped off) modify:
struct qmi_wlanfw_request_mem_ind_msg_v01 {
-	u32 mem_seg_len;
+	u8 mem_seg_len;



