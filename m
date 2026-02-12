Return-Path: <linux-arm-msm+bounces-92659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMUKE1mjjWlh5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:54:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0A12C0FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BB97300BCAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF062E2846;
	Thu, 12 Feb 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSd9fdc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGuN0IW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609712E1F01
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890068; cv=none; b=KA9KcKCbv+7MY7lYRW0PLVLoYapdjlM2K6xMy3E6uXmt/3owMGKskbENCctF2/Lewjcspy9cp77bZXqGH9CV/eWkT66NQeKG5K37fsmoAdl9iwmvRnPRkPp8exeGe4go37p/KI8ursMT201d09RkKPNXmYT3J707K+4CZvyejEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890068; c=relaxed/simple;
	bh=GmhjAy/1K4MYt8nIX+HAxECnTCGqxrj7J17FWHTkP7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSogL6FMGhDo8b7D6oJBcrxQpBpHsp/aLW0D3Ji+pBU4QHABvqLpHyLb/sTG7WuIvK5QVC2+XF5CZKPHy09qtz/9G4g/Y1HBJRSd/MnqjYEzyw9InNmaWdMGkq6p8llFwaQTYNkrrtrVTpHT0XMADVuVsNsN/3JEWzaXRMgApio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSd9fdc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGuN0IW2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RrV1271967
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lzCCbFGefuY3s1HMXqlLyHfK78uE4GSLWl0g/nFYPw=; b=ZSd9fdc9c/07uSUS
	6+VxZBeDwiq/hOwCVDIBbikHazgRRgs6IleJ/+jKM8kOitokeOFwpZo5F+FHmHiq
	CorT8wixcvkSkl5xjatM+rl2hQftKsTGMcjHRzqiJ4qiHVO5JFrjIZ0W6ygupp/M
	XgXHCs6UuVupIp1N61Ki8XYyKLK/BX5uEMvNy4WZVAMAr3pcYFFZ+laoe7oT7H+N
	Lbyg7Lo2C5oSgTCOCsQIZ+8qdDV6EThNlmzTT/6Ox9SYsBw5h1diT2lG1yi9Nu4R
	13BlO9TitjegoetN0Ao0eHFE4azOuvkNCm+0MGN1XTJsPrUI0LjEdegvCIxf6wij
	ZBRKrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9btf09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:54:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so293752585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770890065; x=1771494865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lzCCbFGefuY3s1HMXqlLyHfK78uE4GSLWl0g/nFYPw=;
        b=PGuN0IW2OIuPyvGS+ghL/dlL8j5O0f8haXEKIDMFXLriYogQI8FGpQhsLk7pc8jaOe
         ss7hFRtfcj+OI4W3J9232kiDOp6uDl+xsTrj+SaJLIARLKk7xFBvSDhch9HvPli6XPlb
         VaqDugvUQ9wwFRx+Yz0rIfbIaS2rqDLzsnh/K0ieiBHIF1jSpodfyDgo711kDOPDYSyw
         V7FzJ81an6zRHF5Fdbj1BUEaDWTyso/Z3s943rC6FcaEwNYtBt+C0X013XOZJ0VPueoM
         /zzjixz+6gc6rVhv+GZPZt/6IV9RZcG0DqEliqFE+h85faPrwq7tfxkUUthcgxa+6Z71
         uTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890065; x=1771494865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lzCCbFGefuY3s1HMXqlLyHfK78uE4GSLWl0g/nFYPw=;
        b=FHL6SZoeFrZ6rIfeSMC8KKfMM0fqlyWfmsoERANRIqw0XaitrVYQ+vgNJsKiurm/xl
         6ZA1ECAzWCLF5tW9OgOfx55Z6SAzQ16me7W7u5TInqZ7dYksXEX7jcd70s9UDFab2rCp
         Dd70vhWRTQmkF/qJRratMuND5UjU8jsMT+P8m2TBnxzPB7vOjCD+6AYEvIj8LXTf4enQ
         fYr+Ig4zU7W66dxBM8u6UPZE5Igp4595XBCr8lm3dgrSXMI7eVEAx1lJeuyDEs54+ilx
         yqZciR3o3/HpYbvd1tfOUNiKgkBEUz4Fuf8jVa8iDwifnl2j+UjciarwQ2Phtz76NWnB
         ADwA==
X-Forwarded-Encrypted: i=1; AJvYcCXfNkfEKh9/LCegiZ9z2Y5OwOfYe5UKbNLzucz7U/CIZIl9mhppZ5jHbXY7z5sHI1seK0skjtEUw0WJ1ZAG@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUTpRbA+Vm/8uXD5jA8AF60EpBrpwyAWIgVNDY2OnMdCF/U2T
	i4dAwh+VZmKAP4stLZwMhx/fMjGM60ywB4vcthLi//QXxX8kMoShEqEbIuagrWg2yRbEXOJZ3ae
	O2nr6IMFWLvycewTfV2VzJBopoEGColNUvAycTxWPBitquG25Gl3JhCK7TbOCpSLqqyk+
X-Gm-Gg: AZuq6aJ4aT2woXqGsR2paRZJ+hbqlXyaqOX4XhXDNPizNfBgeFbyC+hDNiKjuxIftuM
	NmiLYoWoM+5sqAf+Cbm6OxDKNCFoXWuXXk5BUqc2bRfGswPBs6cwNdOb+668KXtMEFfOyIgdrYy
	W+c6D6h3G1Ymz9z9ZnAGFYhsa4DxS3qEg/n5W5UTiFnKIHMqj29u1rqZ/PuwPQq8vm0eWPJlXgO
	A1f6I2WASuvqlWPtEhEXzco1AffDPEETBmLDUyLkL19Mp1wpvCeL9hwmRsq+M9ql+xceMMiCZID
	4mbQcPvguunNXBy0IPbnwEz7dhoaKzZrc0sQZwovgzzUnTzLCJG2EjMAAC0WpG44H0I/bARjlgz
	JY1xEg73/MCl2ty8/WWgDpgA42UvXM7MhpTRqLckOuU+lqGvs3sXCQDyyLnklQ+knZlKtkomu07
	+eQe0=
X-Received: by 2002:a05:620a:31a4:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb33093755mr205793685a.3.1770890065444;
        Thu, 12 Feb 2026 01:54:25 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb33093755mr205791885a.3.1770890064985;
        Thu, 12 Feb 2026 01:54:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ecadbdasm143070866b.62.2026.02.12.01.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:54:24 -0800 (PST)
Message-ID: <b1a1f449-efc2-48aa-98e1-1646f092682b@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:54:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L
 compatible
To: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211020302.2674-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698da352 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=0K-gYnqzvueuKcCJGKUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1wOmR8rOFhZdnseA9K5Gg4j5kQFp_1O4
X-Proofpoint-ORIG-GUID: 1wOmR8rOFhZdnseA9K5Gg4j5kQFp_1O4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MyBTYWx0ZWRfX+v/n7DUQ9SpK
 5pkADX5xwJl+oCRc++/oItX0vlR1H8crKMxKjvI1CvAS89l8SyMBzS0FEB55ynEr49SrEPpbBOA
 voDZzGV6AjB4q/mmIEYj81XL7Pva81IaU6V74+Sulz8S/MHxwdY1/8tBLuh8TNb2F9Tp6QpM6c9
 /wOT3KaeDCNEBUo1KrWjr7h0CZp6grDDRrT05Un1mMoKQOQcb0cAHLu3o1QC1i22/C7QHqZLjQe
 rgcyIgfMfGvxtX+A3qR0X3ByP7/QHyNgEJ2nJHutdfRGag4XVI4XRLh7sITVqr6cRUVBZPsQnQQ
 /jbxDokLEUTqugsQBzUrzSW564fWrIR1xgZw4sVD/qiesPKNTHH5hFp1GvrH5kJP84tBHOjdnFB
 uN0uC3hjFwjbUqPR4IQOKOU25UpAO/3cz5I+9djPwURh6aU44++0mR2J3scIlFyjTO37LJx0JMD
 qnVb/+dXe2TUcYFRUeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92659-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71B0A12C0FF
X-Rspamd-Action: no action

On 2/11/26 3:02 AM, Richard Acayan wrote:
> The PM8916 analog codec is also found on PM660L, typically connected to
> the SDM660 internal sound card via the digital codec. Provide a space
> for specific compatibles and add the compatible for PM660L.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> index 94e7a1860977..c7424d755cd8 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> @@ -14,7 +14,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,pm8916-wcd-analog-codec
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pm660l-wcd-analog-codec
> +          - const: qcom,pm8916-wcd-analog-codec

I ran a quick diff and they're indeed surprisingly compatible

The revision fields have changed, as well as the subtype (hmm)

Other than that, there's 2 new intr sources (boost_ocp and lo_cnp)

MICB_2_en has a new field
the TEST_CTL registers changed a little
CDC_A_NCP_FBCTRL and CDC_A_NCP_VCTRL have new fields
CDC_A_RX_COM_BIAS_DAC is slightly different (the 8916 driver doesn't
touch that part today)

CDC_A_CURRENT_LIMIT has new fields

and some undescribed-today registers have new/different fields values
otherwise it's seemingly the same


The digital part has a new rev/subtype value and some new
undescribed-today registers are added, otherwise it's the same


Konrad

