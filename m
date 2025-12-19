Return-Path: <linux-arm-msm+bounces-85867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59310CCFBA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1EF3065C56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F1C32825F;
	Fri, 19 Dec 2025 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/iMW0MW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ns2mu2+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8232779D
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145947; cv=none; b=T3egSImpVYAcu4LZkBncD0jV6Md0Ttq+SYkfTG2EvU6exGH7dqlGjWPcK+6gHokB9CV5UZktJrENTNsZY+ohmZwyMK4i9PwnLC8D9sMnUzYAc31/B+7e6hhE0B/mnwjkjHMnsapbFfOyTsb5Wxuf2nwEzZ2quJlRcYYyP3Vjxs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145947; c=relaxed/simple;
	bh=sE6lssge5bgd1qdgt2mO4nYBxODxtSrGyDYpLcfCeDo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ed7opRxQhT1UMBgPcD88RtrXaVgqk1Wk2a1DcFVn49jBt3OBdQxQNXYo8Eyu1NKCgs4lb03nuAmBIeSYp/U3o+sAK31eUWnTVnIma6DjZ0dqoPf1uRob+Qw1p4pAJJZ1KCjgnrZL4piDOAcKwY2aDzsqJ/g49yv/FHO+rbyNFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/iMW0MW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ns2mu2+a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBlaiT3700746
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ye/VHs9xlBhvGfu8YVFrAtTe4Mu9EMO/b02keiixSbg=; b=U/iMW0MWM6SSHR17
	LOmih3pFkPl1VYx1iFwynrUp3mnYLHcxjZQ/3AskgbVoE929h4cdHwLEp1tvTDe0
	+THuqS04RedMZ7pihjDp8gelNymR5PWhVupYOo5vmgiFIOsSeCeAKpIeqb6o5Ep2
	6pwV/aoYdTia0xjKKmq/EEnCArNJvNv6JUrFp13HlcW0RWyPoicb6mS8Nrv4VcsF
	f0F0R30QIv7akaKxHEKl3/X1JswGqT6gIkNOTYjFyxu7FcDZ27FEPNTHSENAQ6c0
	VfF+DsS7mq+WpnqC1/nnlB7TwetB6+hqBZhhCvteg+JNrZsjzRf4WJ9X62cq0bsx
	HrTx6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejgfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:05:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so7436001cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145945; x=1766750745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ye/VHs9xlBhvGfu8YVFrAtTe4Mu9EMO/b02keiixSbg=;
        b=Ns2mu2+a6fh6aOxMp8yGAGTmF8ccj2hilAUiNVYZ9om4+hQMXUO0gZolDDM0kaqNnj
         bCupL1C+vrAsIk3Wwd/EDO+4rRCJXV4Fivbp5OC36uWDhPjF8QfET6gNCCC3EsrYVtWI
         OMtgjtR04Rt8TNaQThv2wKfoialjNeJT45L5eSiimZuV0rCayiBPG15wTJ+qEDg5fjlz
         lh9Gu36XQE56MZN6USffJs8rohMCdsnTeL6rFXZx9k8POmHo0tBr02HSO+wOE6qb0Nr7
         g1Ehjt00FJ60lDmjqHNH5pouzY+x3c5FywvYImbVIzkYyunTgevZAuE46ZaVmDodHsf6
         sROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145945; x=1766750745;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ye/VHs9xlBhvGfu8YVFrAtTe4Mu9EMO/b02keiixSbg=;
        b=tyzyYu9Xj7gx5mk7LXlTYbFyuCop3m/z6ctsJsVdjL3Atx4ag5DCstm3DZXA/U4lwO
         /Y+FbeK9rtDmq4p8ZZwtXnfP6A+InTRk3c1j0SrhkGveC/wo8rkFX/MbpA/XQakwQUuH
         dcSf1zirg09gOwtWPFBMh0IX9cDXRWzlnXkxJWf/4nCTDPB541icbN9QEc58bvjGNrS2
         9EWrGxWrXWg51Nmrf1ADwHHkMK/XzpXyNMaB5q5UKT2ikllL7KkbzZweL+tzGbWlxsdh
         DKOaW0hUV5u8dU9S1T+gBfZ6KQJJ8ZJjnfGZiF1SQE0GE6e4xciHrTM7npSdoh44u3fU
         ORzg==
X-Forwarded-Encrypted: i=1; AJvYcCXEn9ZA7pD+jufF7opnL6QwKA2Q0XgA9JNtS0sMMWQE+RGvU6ywhTrsJj3/z1kha1iWl5NcILHHPFE3uspT@vger.kernel.org
X-Gm-Message-State: AOJu0Yysec/AZL3roSJ01GoNJwxg+ooFjXYFRBrKjnwcf5fJxqCF69l4
	YfesrTnf6iNVqh90mJ96NhgLjstNsX4bDIa+wqCbVKzapGafTNZVjTh34BGErCOkXFt0PTyM4zY
	iXUNcvlFnVnbopYPiKZF/zLteT2hTdXQgNtvir1ovhEfFrqNgft6vCrLRDGBEdK5xw0mZ
X-Gm-Gg: AY/fxX5OgqVT4lwLNkW3QNiXuxd0CwiPWHn3PaYlZPw6RTDWUb/Gg/4ogG7sMsyH7QT
	ChSMRgvxeyp62r/7uWQl3dTHdrP4UpFTZcBBiORK6xFr4E93P1KbA6pYxay2YjgmpCH4uxn90gG
	TzVVwglulmOQLgIfwbcnQKYU7ZUc+2BWb6z4rjs5AllPKzo9mG74EX8b9uydCjTQGzGxzY9v0Rw
	6O3IdvUT0QXwQXLRztfQWfNX0rIYVgOKDA4KsK1Jx5UjNNvKv8xdsvz6xw81X7tCF+R5xypLE78
	8atgvX+49e009X/XEWqefU50kvsVUz/pjsoq0yRKVUS3MghBy2yu4bQWNp76gWlOUP6+h8zFrju
	Cx+XwRkggIBTHe0vFsE9icvbV3XexTOvtWnZXzbCbuYEyQvA9KyswProBQOJNpwj3kQ==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr26138641cf.3.1766145944369;
        Fri, 19 Dec 2025 04:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzfMOuSFJ/OJ64vZEqDhf9U59LZhw8Cjqpg04L/6xahb/kAkvh1Fyc0HDbUNbC180mQH0aaQ==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr26138161cf.3.1766145943850;
        Fri, 19 Dec 2025 04:05:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef2bsm212467466b.68.2025.12.19.04.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:05:43 -0800 (PST)
Message-ID: <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:05:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tomas Winkler <tomasw@gmail.com>, Raag Jadav <raag.jadav@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
Content-Language: en-US
In-Reply-To: <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mOiCnbCurjM3aFp0-DRsVftvj2LGO-es
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX9bnwGa93pIwW
 a6oa6BLqXW4cT5i9+PpQaZlk3L39skpTyEWZJfUCDFFPTEkKfJJp0scjpFmKXQX3DmBfouMKJWY
 mEGz1omd0CurT0HqMzbsb0i67mpHPmN5yxuhnJbKUv0W6tB6Tc6FVTUay24dlW3k1ZXiHPoxVEj
 eqmY/s1ulPu9pLKYMS7opsj6yq1I+RlQwHAi99w7B5JDMW2p8urXwUjBxxAjeN2CnH4w1euPa2X
 Qkdcyc0hkpkEmBjcsguUThjMhO6apfO1XE02uf/wZ8Ydrw6Tn30NdmHoheRByDzpsJsTCBhTtoZ
 sydVGum43okagD/l/Z5JiWKeZNrWHAXT3OYt1FQyM3tfdw7QgZ1ad2FjavrB8R/5z/JgkM0ftU8
 +NeRzOktPq5TpdcdIPlmAtF1W/BniKGaKCESp/FEysaSjLEI3rjU0YguR6nu3daG2SIv/AsIdvU
 noTvrQaLItMCbFJq1Pg==
X-Proofpoint-ORIG-GUID: mOiCnbCurjM3aFp0-DRsVftvj2LGO-es
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69453f99 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=5rMr7QXivSIVLOAxuCIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100

On 12/18/25 7:02 PM, Junhao Xie wrote:
> Add MTD driver for accessing storage devices managed by Qualcomm's
> TrustZone firmware. On some platforms, BIOS/firmware storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world and
> all operations must go through SCM (Secure Channel Manager) calls.
> 
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +struct qcom_scm_storage {
> +	struct device *dev;
> +	struct mutex lock;	/* Protects SCM storage operations */
> +	struct mtd_info mtd;
> +	struct qcom_scm_storage_info info;
> +	size_t buffer_size;
> +	u8 *buffer;
> +};
> +
> +static int qcom_scm_storage_erase(struct mtd_info *mtd,
> +				  struct erase_info *instr)
> +{
> +	struct qcom_scm_storage *host =
> +		container_of(mtd, struct qcom_scm_storage, mtd);
> +
> +	if (instr->addr % host->info.block_size ||
> +	    instr->len % host->info.block_size)

While it's the same value, it seems like mtd->erasesize would be
"idiomatic" here

> +		return -EINVAL;
> +
> +	guard(mutex)(&host->lock);
> +
> +	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					 QCOM_SCM_STORAGE_ERASE,
> +					 instr->addr / host->info.block_size,
> +					 0, instr->len);
> +}
> +
> +static int qcom_scm_storage_read(struct mtd_info *mtd,
> +				 loff_t from, size_t len,
> +				 size_t *retlen, u_char *buf)
> +{
> +	struct qcom_scm_storage *host =
> +		container_of(mtd, struct qcom_scm_storage, mtd);

Feel free to unwrap this line

> +	size_t block_size = host->info.block_size;
> +	loff_t block_start, block_off, lba;
> +	size_t chunk, to_read;
> +	int ret = 0;

This initialization seems unnecessary

[...]

> +static int qcom_scm_storage_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qcom_scm_storage *host;
> +	int ret;
> +
> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, host);
> +	host->dev = dev;
> +
> +	ret = devm_mutex_init(dev, &host->lock);
> +	if (ret)
> +		return ret;
> +
> +	host->buffer_size = SZ_256K;

Should this just be = host->info->page_size?

[...]

> +	dev_info(dev, "scm storage 0x%llx registered with size %llu bytes\n",
> +		 host->info.serial_num, host->mtd.size);

dev_dbg()?

Konrad

