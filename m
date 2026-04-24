Return-Path: <linux-arm-msm+bounces-104497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLjFCoHl62nNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 23:49:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E446391F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 23:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6101F3016CB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 21:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2163537C6;
	Fri, 24 Apr 2026 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2fB2Y+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLbMwkiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A49285041
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777067380; cv=none; b=YM/miBES2JOAThFvK7zeGihvEQ+c0f4ZePHuddf00vVsJMwBSHOQDudz2juHxvTZsCg/nksjEnngxUws/e+6lEmOAcLPpLkb17BfNmlE7IX0uHaBMuNJeax0aGO3x1z4GgPETRrPkc3LyTKazPKylhJ1j/atoAoflBY6oVr25jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777067380; c=relaxed/simple;
	bh=+XYWczDOoPybU5e0IdPXSu9R5cSK6HrDm5LBv1YesTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5tkUtZPfHSLKl0U5/hKSJ6BYPCnMIEF1adlg4PobCiDoZrUgoQM521dnW8pFfyvx+nEkH+sV1KyrNrvuUHeux7nmMZBgf9HZ3psqHANAyB7gvLi8YTJERFMoiuLMmwPclQUArbPXZ+ZrEy5hiJaXyd429IQ37u8m+6l5B+l7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2fB2Y+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLbMwkiV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OGuZfH1243911
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 21:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KG4vOmtiLHVWGti4JzTme8Kd6ok3qEZubhJuWpQcuRQ=; b=b2fB2Y+BI+wSGlnm
	jYAYnVIObd/nzA4Os47v5pnAqzFIZ/T07aLHqeZAll8Q07nYw/5GAgpJYh2q1T8d
	A66pU6b8AAR7DeDL81eRdphYrvybB/w6pLyEXEfrRn1Md3WxekQevTIx48w5NTQE
	OCqFmdCVZVggzwjQoXDl7AyXGmNDLckQQ9Z7IrknrnKNdMeYYAbT3fruf3e/8LgQ
	ibc8P7dfqlnZb8bKovv8j1O9t3jHhhh27UidpMTMThHTdfyj3dFv/z1XfYGiFjBP
	rlqsQHwSEKBtcaNj/U9RdZ8q4IO9iyjo6wPXO1U+Ys4SOh8vordvcBYwJ3SRy2HL
	F7lXGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n3b1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 21:49:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so9409100eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 14:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777067377; x=1777672177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KG4vOmtiLHVWGti4JzTme8Kd6ok3qEZubhJuWpQcuRQ=;
        b=PLbMwkiV45Th6W6ec5beO50E67gq0+egGxHVPostTnKgg12+EYzByG8v1fD6YEtlJU
         z2qiB998iuoTxM88e6q95ObA7HyqS4zTX+C/v406ui/dxnyI1J8TiQ/7nM1oR7XwdVQP
         1OBLYucCYN2UM25M4R4Tf7AOwDShG6dvMzWc2APtQITSspxRkMKL5rJGxAchsjMFeYCk
         +oNk0Lp/Wi8oac0U/y1uwWLMrkM9XCs83uTWYf0JhPxCqdBdS0ZTd9AojwQmPz/zH6Xg
         CIqj2vF4pl7icUoVUTphIfQGM2DruMzwrH+BXepRHbcV1r7c2gBZM/gd+gejfL/b8sr4
         3JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777067377; x=1777672177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG4vOmtiLHVWGti4JzTme8Kd6ok3qEZubhJuWpQcuRQ=;
        b=ch4+sofDtmjVc15E1ykAfmmkLo8al4KlhF8ci81QK3HNOauUSFg74ltu7eLzinq7JM
         6xfsV7q7mtYPU20Qelx019YjiBRMkfUbzx35XhijQsuSxwCVfnE8bibKJXuUu1XucZdb
         jfNw2MtC8f6ENtff/5YnR/g7zx0Apa+TChRXuf7GJB1EjKckJi5zdLsQCUiXzpiWLxxQ
         s4JYhPE52ObNdGouBmmeTH8tnPzaKYaaCvMo3FvAk9txq8DEBqqlsjRdT1md1VUIhhy8
         jXctCYs9PD2sJz8F6A2d43FtGBAgX6Uylxxkkr2yMqFdImFESv9o03p3YklnZxm5dfmv
         zFNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IW+y4LKLL8vXLErJ8JK084zfMPcPo07yTVG1gMa/ouWm2XRQXvrKUv9D4Vo1PtLNVsJMBJEiuCsv47C4e@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8bpBF5npXNuo/A11PQNgtM1g7Omk7uiQmFDaJNABEmRW7AFH
	YHvUAgMp9JD/WJoDjwadeOooiH/essBzwtDvbulAOQRaE9709wQCBgzjUs6sxFlsEaIwhR0n7y7
	v3FPSDjxct857nce0+BkS6wk8YuojbSI3Hq944ynuiYeFWNhCvJ1NCTakJnwemORteiDl
X-Gm-Gg: AeBDietIGQ8juZa7gBsASGkKzrRf8LJxDaONS8OCHBQIS8vbe7PZXcesIATakgxkGTc
	or7cfFDCA55hYre+CJcsQVU0ZhR5hRSnWxh3bDRaxKnoYv1CbX6/NG4m0u7EwF6vZnxipTBnFUp
	u1TquJ+yoq6r34gu5I08Wqq91pFhcOuI1yar81Q+D53+x6V+3ohpxCKphda0lSdA2DotJLK7Sjp
	KwKUgVCAZIn/MgVVxC85szVBmYWpEQfEAHjya91Jx3Xn7vFGFTpL9I9BFq90AO4YYY4W1Zqw5v7
	lddPonFVGp/Dfaq+kCbh/zM0p5i0M7TavCNtg5enN4mGbqZQ42Zk50JrVuoyz6Do4MO/TnTcqTT
	B7qlAmPX4gU9xgEfE5Taoa+pEf26571P08jjUd/cuT9HD0rB0gXcuvbw3sJ49Ven3DcsRtILlIb
	W0gYjSCZGx36SF
X-Received: by 2002:a05:7022:69a:b0:129:fe5:117e with SMTP id a92af1059eb24-12c73fa3c8fmr16125446c88.26.1777067376963;
        Fri, 24 Apr 2026 14:49:36 -0700 (PDT)
X-Received: by 2002:a05:7022:69a:b0:129:fe5:117e with SMTP id a92af1059eb24-12c73fa3c8fmr16125430c88.26.1777067376241;
        Fri, 24 Apr 2026 14:49:36 -0700 (PDT)
Received: from [10.62.37.228] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc81d0c73sm3673850c88.7.2026.04.24.14.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 14:49:35 -0700 (PDT)
Message-ID: <5008f174-340e-41a7-9dcf-f09495c1fcf9@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:49:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID
 GEN3
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZsjfQBbgTaj1xK8WUNRO-GBrK0Bo2_wz
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69ebe571 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LgFBGBsrqOKMokOYI4YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZsjfQBbgTaj1xK8WUNRO-GBrK0Bo2_wz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIxMyBTYWx0ZWRfX4YnNh/8KTuOg
 WK5UzyJl0xE3ECPpEMIv9PmXvm1aTS7mQWWpCmgDZFs1XOMzo+GdgVhf8v02kkJFfhg8WBD1wyZ
 2PVzCTpGl+gMCFu2By5i/v0fCqxSxZqXiXnjnrK1h3ZmWGDcH/VFvjVw3tBSamzPyAMPiF/YBAo
 2L4xOq6xiTUxnY0tt9HMx92DHVkCF7I7Mp1wEe1MbTSjG7mxITrDb7QRCarV9V8ZtbsAMITG3wR
 Vnz3LYRjxtGnxvfRkOvjQRWlHvJIGj2luSa7VSLMo6fkJ4N24NLkV2BahHeX3p5ESAaBuMyu7Ap
 PrHV7Ia+vFCEMH3P692KDVKLuyWpkn7EsJoLaNZi/IluDViv5j1J1XTGUOmACCjPZWDmdEn5NuY
 zucD+3HLkO1qV8HwmsH43ECMzEGK40TMdli/wqISDFE7zTgXIjOnYAIoLawKbuXvZtrZkXl1PqA
 Ze7WukhU8sBLld933lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240213
X-Rspamd-Queue-Id: C68E446391F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104497-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


Hi Bryan,

On 4/7/2026 3:34 AM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice only
> VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.
> 
> Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
> 
> Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-csid-gen3.c    | 28 +++++++++++-----------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index bd059243790ed..ed5c5766efd36 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -145,12 +145,12 @@ static void __csid_configure_wrapper(struct csid_device *csid)
>   	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
>   }
>   
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>   {
>   	u32 val;
>   	u8 lane_cnt = csid->phy.lane_cnt;
>   	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>   	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>   								   csid->res->formats->nformats,
>   								   input_format->code);
> @@ -163,14 +163,14 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 * the four least significant bits of the five bit VC
>   	 * bitfield to generate an internal CID value.
>   	 *
> -	 * CSID_RDI_CFG0(vc)
> +	 * CSID_RDI_CFG0(port)
>   	 * DT_ID : 28:27
>   	 * VC    : 26:22
>   	 * DT    : 21:16
>   	 *
>   	 * CID   : VC 3:0 << 2 | DT_ID 1:0
>   	 */
> -	u8 dt_id = vc & 0x03;
> +	u8 dt_id = port & 0x03;
Sorry if I was late, I think this is wrong. DT_ID is more to shrink the 
data type of a stream from the sensor into 2 bits so that the number of 
configurations to be maintained in the CSID are less, the way the HW 
logic was on previous architectures. Now, the older SW logic of deriving 
it from VC itself was wrong and making it port based that doesn't have 
anything at all to the DT_ID or CID is making it worse. Do you want to 
just maintain the older logic here?
>   
>   	val = RDI_CFG0_TIMESTAMP_EN;
>   	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> @@ -180,7 +180,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	val |= format->data_type << RDI_CFG0_DT;
>   	val |= dt_id << RDI_CFG0_DT_ID;
>   
> -	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
>   
>   	val = RDI_CFG1_PACKING_FORMAT_MIPI;
>   	val |= RDI_CFG1_PIX_STORE;
> @@ -189,22 +189,22 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	val |= RDI_CFG1_CROP_H_EN;
>   	val |= RDI_CFG1_CROP_V_EN;
>   
> -	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +	writel(val, csid->base + CSID_RDI_CFG1(port));
>   
>   	val = 0;
> -	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>   
>   	val = 1;
> -	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>   
>   	val = 0;
> -	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +	writel(val, csid->base + CSID_RDI_CTRL(port));
>   
> -	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +	val = readl(csid->base + CSID_RDI_CFG0(port));
>   
>   	if (enable)
>   		val |= RDI_CFG0_EN;
> -	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -213,11 +213,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   
>   	__csid_configure_wrapper(csid);
>   
> -	/* Loop through all enabled VCs and configure stream for each */
> +	/* Loop through all enabled ports and configure a stream for each */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>   		if (csid->phy.en_vc & BIT(i)) {
> -			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx(csid, &csid->phy, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   }
> 
Thanks,
Vijay.

