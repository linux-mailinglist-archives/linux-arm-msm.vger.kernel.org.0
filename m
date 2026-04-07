Return-Path: <linux-arm-msm+bounces-102046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKDyNNZ71GniuQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 05:36:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541083A970D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 05:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBCFB30185AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 03:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FCB37473A;
	Tue,  7 Apr 2026 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEuD2d4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxR8JWuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B882374169
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 03:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533012; cv=none; b=rY7+oBbvc6FtyuFAFxAJvbcD1e1PujPHfhV+R2hmrt6aWaFuZ5C9ZyUY7rFjnJQ7M5s+OVSB2FHdRV7gQIUarv/rmmNEZwbaw/+PyGYpuTUOE7YZY2dctU8h6Sleo2UTUWuNnjdtjUAwY4Nac7hrrV1WtjgRAJf6Muiyuv8lJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533012; c=relaxed/simple;
	bh=z391g2w7sv7AiQbBUH5trzn6m5Ncr8wOxsHwKHgxfM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKr9v9Onx5O5TUJSkzYX+3LD0VzcfOR4Scp1otdkcveXOUMdKH3OUXu7wt0JRsseUOViZjRXVWdlQN71HIh4CUnrZgyiSQCZ9vlxAbdhp4W8D7eRsQVyRtLncxF+/6iIyB7qz3hQlYID3R6LE78GUHNy7Y3cjW9ZvuwGbWqDmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEuD2d4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxR8JWuX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LTTNA2581367
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 03:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=; b=DEuD2d4MzKHmn+xD
	dG3A3/CrH2hUhrmOnJbDHoeMEsmSM02VNSOtgNA59pPT7xXC+KLkWTKZbX8gZ9kC
	amCBzA9hywFTYih1deDl3RF1jEHc5AD5kg2hblAdto9xFMdNeTia/qYJjJc0TsOv
	0PpiEUnC7chhmwrSTCkiejEpz5AL4JTyNno7K1umFMriM2LKs1P4MyinxC/FBsi1
	i1Sy8YM8ihnXU65sx3tbLlQ2VNFHXZ8MyU0KkOsy3OKjyHqNCaLL2C3AR05xHN9e
	UviZRu/HTTeEWsusWmCBEK/TETddsgK4YytsY2RQjqcne5G55T1Tw0oYatoBaMOH
	fqtH7w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf0ur3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:36:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2677562a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 20:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775533008; x=1776137808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=;
        b=cxR8JWuXPlc5FE/pUjumNtxP59IuJpsm1ZSF3wHx9az4VHwewijXAVG0vIgBpZoYnB
         ILp705+SKEw+y1rfDOrtqX+bgPigmUCE/4NthC11UcSdCq1EyTHTGdoLO1NLZdFJZgeH
         JkKrW27l0AVOMwx9wLMDPoyHMZChQSTy3d1VGSskOoknWdQakcIInK/dllbgYyPfKUUK
         7UlHJQH683bpodFkdlkwzXWqf8L/po62RVGI6cxAUIHUyy+uZGQ6HsCVsTlMe5X3QJyX
         7SF200c8jDjFSZB8v0u9X+H+OEx7tJ/KRER0eNVuXznTz4AKNXlg1JD2wniCuPcTfpO9
         OJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775533008; x=1776137808;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=;
        b=UNrxyHY9yiHQlrMkkpt2OKKK6JBccZVfXyWCYOuzXyBlyDnatVtFu7a9Z+OxdoMZ5+
         n/JoiSeOuk9MB6dki1eeH+gnOfJIxWBuvphCHZACFGBO4gsZL62f1XLZBq8Hp2nMFu9k
         kvjrKupPHRCwaZeKCfzgYhqnthDEon3jOWo+5POEjn4xvU2mF/aATBribFRHL6RIs7ZA
         X0wgJfNvh2FtDlRTowdJt+/gwrU3uoyn+tibANW3TwgmO/6VCgt+RTYZLobsPy6KHZfX
         CuGXyk6R+V/69Ja/dn00YNVFUF0DYCSQ+dgCfAlIJrj6ZXiGrSP/8fM/twtD/wTtusPI
         Hg6A==
X-Forwarded-Encrypted: i=1; AJvYcCWH4IPtdoqS1bvlnCioDm6UO79AU/7kt9P4BKgmXCi+RCjcdCVLN724B7sdgn+VLunVuvGmpBKoLLAl+PeM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Oth5GfFiiMGVWSzQpQueevCYYTOzLWmtfEI9OffdDzHeQX+/
	yxDi9OzRlFmRIn1NGp2FIs78d9AWl+Of0531W1DyGoODqjfXHPh4e6sTdRCWQBpMPlmm9fJabCJ
	e8AnV4ZlLwXNNmhyCB2ET2CvyqD3tCfGdyDkpcWUOT4p/9AIy6G0+r/caPoUq4gGq/s9F
X-Gm-Gg: AeBDiesWtQptwWPcWRp0KOcLrJJgHbHFi7Z5ZusCH7DVOd4uYVt3srnyMGdSJl95udv
	rzuDijuupKr4L8xDg1jWAzwQ6sCioIvQlBS5fojdnGiPsm/rfnX8ek5VmrEuc6NCku6zMVKQP+a
	jjtTHwtVjLCH+jgWd48KqKCOB8RoKDYdVuK0SoDLiqFuPcpzH27xcjJYXmMcPhlLuQxXX5S3Umf
	HGk0lkRdx/s59CvDHF6AXdITAnCxfoaUQSyJN5Zl6i4NCsaGtVmFmzRP0LhnIJZgBoMXeYLvnQA
	+dvrNdev9eAGHeQ/BcHYmqBScb2JhptYcZgJK/lFnh564XMaHCYSdyOQYMsj3QFidDnylIpDjOW
	LBVC2mT+45kX7nqMwuU0DCPH/6LS9wjrzpUTILg0l+UCuntPAJzEybY8sb71/C28ZLR8FRBGc6c
	/lUNB2i/7AfkHYZb6SAuU=
X-Received: by 2002:a05:6a00:1805:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82d0dbcfad1mr14887003b3a.52.1775533008190;
        Mon, 06 Apr 2026 20:36:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1805:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82d0dbcfad1mr14886973b3a.52.1775533007669;
        Mon, 06 Apr 2026 20:36:47 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm14351181b3a.23.2026.04.06.20.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:36:47 -0700 (PDT)
Message-ID: <f970b6ab-63ed-48f9-a49d-06c172656379@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:36:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzMSBTYWx0ZWRfX8T/e3/hYzpV1
 MbQ2++cysNNqo+vkynuqzthL258Q+2ev2AiGXZliXl6CMntV572UTGJh2WMeSZAbeRNpLRO3KrC
 Qg2a3Nu01SeX06HGvKpUHZjnYxcAQkVKw0mAs+hlI7WGr1za44V0U4NyezIqxUzzi4dRFepJ/Wm
 RrnPWPWT1clcQyeo7ittWbRVDWbK6Nd0WJBK/wlN2LWZTxERRR3GCb49aJyQSeUgNQuarJtQIKU
 B/Y7KT35Yp42DXMdF2syMO5CyPNAfEk/1C31VUDQn//A5sTCIUgyRteFyCvbej/FKRqOFDhTZjd
 xEm6IcNokO/Z8sICMWd8sT0t6FxeX7XAGl3Lshhhr62DzFemOYXF0Lo3CYeogj4ze/foIND0VzJ
 ZLLtPok9MHKbQVe333LXRjatschkhO/2y74nUtrvSmlbgQHMHdzqKFmH86amNKP+vOZkG1s9owg
 P0YnGpk2gPWCAh65ZxQ==
X-Proofpoint-ORIG-GUID: KVQqQnQFLJKexCKZVO9iYTSucaxToFCD
X-Proofpoint-GUID: KVQqQnQFLJKexCKZVO9iYTSucaxToFCD
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d47bd1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hFweg1R52QcHjneruXIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070031
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102046-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baochen.qiang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 541083A970D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 1:57 AM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index eebd78e7ff6bc..e7f90fd9e9b83 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -808,6 +808,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
>  static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  {
>  	struct ath10k *ar = qmi->ar;
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>  	int ret;
>  
>  	ret = ath10k_qmi_ind_register_send_sync_msg(qmi);
> @@ -819,9 +820,15 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  		return;
>  	}
>  
> -	ret = ath10k_qmi_host_cap_send_sync(qmi);
> -	if (ret)
> -		return;
> +	/*
> +	 * Skip the host capability request for the firmware versions which
> +	 * do not support this feature.
> +	 */
> +	if (!test_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags)) {
> +		ret = ath10k_qmi_host_cap_send_sync(qmi);
> +		if (ret)
> +			return;
> +	}
>  
>  	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
>  	if (ret)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index f72f236fb9eb3..3106502275781 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1362,6 +1362,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
>  
>  	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
>  		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
> +
> +	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-skip-quirk"))
> +		set_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags);
>  }
>  
>  int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
> index 1ecae34687c21..46574fd8f84ee 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -51,6 +51,7 @@ enum ath10k_snoc_flags {
>  	ATH10K_SNOC_FLAG_MODEM_STOPPED,
>  	ATH10K_SNOC_FLAG_RECOVERY,
>  	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
> +	ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
>  };
>  
>  struct clk_bulk_data;
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


