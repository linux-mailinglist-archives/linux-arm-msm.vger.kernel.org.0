Return-Path: <linux-arm-msm+bounces-99635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOJcEfN4wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:43:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BA3077AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD52F300828A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2CC3822A5;
	Tue, 24 Mar 2026 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0J34JIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfwcBFTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545743EAC76
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352259; cv=none; b=fzCbXKABT3OabRPY2n8pKvYgKXNU5x/lFBcDIe+QggaeFonZ3BCLzUqnsCUOS4aDtc36m0dWHohDYlCIxtA+Z5nQ6vBPyRo9+DBxxtLHFZTGS+udOczSPr3vgG47YS5E3gJUt5/hsvYWTggNGqeALygjyewqZvVHPQumpl4r4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352259; c=relaxed/simple;
	bh=kadTKCReBeNH0HNP5FL6cnlA6hMu9YPA8eqCV7krTCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rn1aSHtA8kQ30KDrK+b3egvdtdaeZMpfxI8MQrobsRIvorKwUAKmcXfXKhoz4jXpSxPhtMoARvcH0PmthTbW5njvnYSxc+HI4QS94I6HtMhQzKv95Wy+K5lMCbP9ydwj1jC+7W1c8Y5OOXlaUA2i9kDaBET8i14QLU2gWJACZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0J34JIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfwcBFTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wZWp3039766
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGeHANdvGzuHUf44Jb7BpgbCb9hLN8bSMbkx9J2MijY=; b=I0J34JIR/PTku7Nw
	cGtnTaVm/hOXhCouEZArtoGZBqX+Edsvn7ox8jLEwHVmwquq2a3n6dHBQDbKgbuF
	Ef2oktr5Opw55TGOA8GH0ktLKMC9TZkr63TmuoAVcYKlB8TmHd/a3JaVF7z7gJsv
	0YVgnhUJJY13cid54xnsSt/Y0M+IaVY7unASDRJZN7jY5vY1bjs/L+3Ke9rJC/yo
	3McF/GLYtOnh5CzDzMOYoKL1PZBrVeM951xe09+sMQSgUah7zYXM00rL+oTnFkc0
	YZTgmA5pG1qefZgRd4YBwnfZ6kT4EK6pYvL+xOKe2lOXMjNd3IfadNIg5tdfVImS
	hH3sEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0gbbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:37:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cbeb95521so907506d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774352256; x=1774957056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGeHANdvGzuHUf44Jb7BpgbCb9hLN8bSMbkx9J2MijY=;
        b=HfwcBFTreNKtKpYHSxyOgE1UF3rn4dU+QqVf7cjj/RJIf6c5GetRlJ7hy3jhllTiya
         KtxmmWtBM/v1SBsqC41HIrrW8xjV3SgplZ7LqKgzMgqFRpzVKUg45bqrfqnDCCjW7Db3
         cUqlrbkAb2Y5d+MdN5xT5v+g4xJOykSPxCQnn1D2G3HWQoyuB80UbZujuLF/TEFVxQTI
         l9iF0AlKfn4D3aECYkmNxTOTt3FnEY6mmdwiasR9VrJX7qh4gXU4jnJDeOgjkf/zRMxo
         TJazHEIBCDNUyjgMa+alALYlFJQ1p9SbjL0yo1PBAbW7N8LheUJJdUnCg9d873vuXMfI
         QDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352256; x=1774957056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGeHANdvGzuHUf44Jb7BpgbCb9hLN8bSMbkx9J2MijY=;
        b=djotTc+hTvHYBuVIGK8vBb91m6grskZ/Z8jyhqQSpmN8iSgDckafrIaA1+BioEAtTZ
         zJFMapmpDRe2DoM1hnuo2arWWuiiHwCzvSqf8Bht+PJrgSSE/GKznOjZwptBNk1Ca/Rm
         IxuZ4bo4sM6SNQ2dgQ623TWXLpAp0gG9tMe1K7kvwTC94SkHSdYFuF90WJdM4mZHlO7N
         KJW2o58ynYb7qwDWv9PpsY38JQrT/WysR60csxxQUcO+G3XXCHutnRtOrlkJp0l7/Bji
         oMRn/OoSngHNERkpFP230mmzW2EZBPIJ2svWuIU7yTMuDBDwqsqnH5+CTblwu5P+82YH
         M4qg==
X-Forwarded-Encrypted: i=1; AJvYcCUN5N+XzjskmfnSpWYwAtYRyiChskGf5J9p6Co5O4WUT5JIbo7gs7thzHGPbInakndWJlrfmDU3u0IwDvs/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Ygdtl0/bYX0tqyWDjEnzW5i4869mWv+YAS+7GuMI6bUoxhO+
	3v1Qz98+T33aJ3wef8Ow7YnUnogNyEzEh2mYT9OTTKTJrhzu1I6SMNyP+Ar+/u9AENc7cJtCZ8r
	Mtq1ejEr53vxGKzjWgYducFhKV0DT+QjWDbV2yv/Iv3/WofmswQEcynSeeM+EL7g9X9UG
X-Gm-Gg: ATEYQzwgQWvTNpStH/GtNbGxCBU5al5djCiJ8Jr3qDwNLUcjx/Y0GjlWvzb8RPVfXfj
	qS86jWhR80QjwESm1icbpaHwTEftEUiZDf0bhVOe7kEy8HMryPyCg2TsWvqL+Hb1CZdAha9wYoU
	WYjWH1jLTkAYfS0kxMtVgsqxejhwrTHdih9SfqS6kLjYhs0A0BgZrFWUyFiEjpEt8hUqfo97WbT
	JxxNQyZrJshhGAxoSLEe6XRZCkqE7wnas1e8983wTVum0XurT5eIPBc1Af4LaHvhaM4x77kOYyE
	OSmbIGA6EjwL8UPvLdRrqahPd3g3Q+r2y+JV3lIDHaU4tmN4QXr7At6LpDBWVPirczo6PdqWble
	mIicYQGO0Ycj/5MKxiGWmTuHcRL0SQ4vSJCMI/+Q6wgcJqsnIMfVgOXRZrm7Y5PQRhJTqz/JO1U
	ZIvCA=
X-Received: by 2002:ad4:5d4d:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c85a69ffdmr207689756d6.7.1774352256520;
        Tue, 24 Mar 2026 04:37:36 -0700 (PDT)
X-Received: by 2002:ad4:5d4d:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c85a69ffdmr207689466d6.7.1774352255984;
        Tue, 24 Mar 2026 04:37:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98336675e1sm609963766b.51.2026.03.24.04.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:37:35 -0700 (PDT)
Message-ID: <98bd9c5b-4cc3-4aac-b376-6c9e653a7a81@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 12:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add missing msi-parent
 for UFS
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
 <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5MiBTYWx0ZWRfX1F5DSMVN0d4l
 Q0Lr/CVUhvuhV6MOAQa+6sRKJC7B9yBwuPWGmHKgE83rtCEwQfVa+/uYIRFHpNexBlTnUmHF00z
 Mai5nklchb5dmCz+5EpryUMDZtlaDBzlH0SfxBWx1yGR+h/SjD4vQHlkEvuCZSDv4Z9Zblng6E4
 Ko98NzlyeOhJ09vrFQY6gUWBz0e8Bpakw5ZeCRlwt56tSnWmTUVVJbQx8ODKoByBoKga9AY5ag2
 wlpH5j7L9akvWQW6ZdwhDJbgEALm/SBaR0ade9ppYQbRL2T+2h25Y3PbelqwNbxY9RMKHJ4HqXo
 azNE2pX4L1MEGQ9ZG7p66kzxp6XKx8lptHgowQXg5CzjrWjlvCXAFYydYEUwgZgrFV3ItB3boeu
 e2CV9lIlxaWXAJ8rPA9rgdCU2Aev3KNM/KXwxoubZ7yYBxbnkH2QGSW9QIVeHJGg5pIp+/RZ36G
 FanQbHbZ0eWUuZwpT5A==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c27781 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=P4vY5hjairbks-F6ILsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: RrBaqj1Oej6fJJZRo4iunvH0ktXvRLWV
X-Proofpoint-GUID: RrBaqj1Oej6fJJZRo4iunvH0ktXvRLWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99635-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B22BA3077AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 8:23 PM, Abel Vesa wrote:
> Wire up the UFS controller to the GIC ITS by specifying the
> msi-parent property. The UFS host uses MSI and requires a valid
> ITS mapping in order to allocate and receive interrupts.
> 
> Add the ITS reference along with the device ID to match the SMMU
> stream ID.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

