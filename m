Return-Path: <linux-arm-msm+bounces-85860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92BCCFAF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B124830FF702
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153CD331A51;
	Fri, 19 Dec 2025 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDyte6oI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKv7GuHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8E331A5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144737; cv=none; b=QAONoFykAXQ5j3G+OjC57aP+NGITk/Ldq3ruVFzc/8FZ7BR8KbNDYj/j7Y1Uto+02ankikmwihn5D4kT2oWeuu6PqungmrlqUFljQbYcerXULgTbTBCYRGruEfbstAJqPF5q9ANP3PqTFA1STR6G2odplSFWdPiycAyBCrYQGvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144737; c=relaxed/simple;
	bh=irEAvrdRaf6875ZID1jYgTi4cPaci2203RnrQseavls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZY98Dn6E5r04PlQFhOlgdn+nrtFO73fWB2EfXo1S/BHiONFnLOaQVXosaidxgXU5fN44eqibRyRTzllhdu4hhPat0aU/smtlvMYfaMjPdQR6wBbQkB7Wd8yh3Y5VqLJdrOgXoVU/MxPaRcIjJFwz9y2FDoAF6Xxgd9+ReKOIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDyte6oI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKv7GuHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBY9gS091853
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhUx/wL8Scv3qSsZrRmKOrRlXmJZdg37tIib1c09xSI=; b=dDyte6oIHG8BpbbF
	T0W8qAkyiUu8A+ZS2sIcNQ6zPihDFbpBf0GDrKu2CZP2fM4Dgw+OoX0LI5vLZ5lk
	NykT98vz5GbURLhTUed+EZfDAriQh7+5NLyPwPCVPSQt5EamiwG/hYNNU08RER9w
	oFqBIEYAikps3GZqhy5BWS/TcauWwqXgwwZumyzYqMR0Vg/FIi/1dOPCysMyl/nj
	T4ZTFUKZ2jSw9MX7ffzffOmz9kre/hcYCpYN/cGvFPSiM+bgI7NGJk+90ep5hOjS
	6dqY64g3Y9i5FP5CCuXRqpiNX2MY+f98h1JebM0MSE0yybzcatYnQ/JoxUzNKjSv
	JEXIKg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eagt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88882c9b4d0so5239146d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144732; x=1766749532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhUx/wL8Scv3qSsZrRmKOrRlXmJZdg37tIib1c09xSI=;
        b=LKv7GuHWd2dm3PEJ19zxbwCYL+QmPHCD5oQFMAGCkgDnSzvI2iV4YDR/dmYAvsUEDO
         up6VlmtFmWT8V8HDNsJgkWbUUd5JmvY58IBaczVTk4jYw97Ac2cRk/6bopwMyW5xrE2M
         vucyB78k+wDoxBKW5iASM7eLuPYKj1TwnmCss50mHtFyRyy+QSNyBhBC9qxyO4bV9Fgw
         SHllq6/Wnzl0ytnS48iDMQRcUqI4iWVl8+Ep2Qq7qoHWuQ0HdTAYqdv0VxlJxnpY/+i7
         MLm/PaGi2zWNgSJ8i90iLiLK8Xr8ntzhbcB0xEa7YlnB+n52IyEXq/7hLKOR/xal1sUU
         N/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144732; x=1766749532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhUx/wL8Scv3qSsZrRmKOrRlXmJZdg37tIib1c09xSI=;
        b=t/6MpVo/iy9MABHI/bTfLfY5N6TewLmDZXKhZfE7tF6cBYox0cg/JAH+FxcsD8CRKe
         EYmVN268TiwwsdaVWs3/VXm5Bq4xL0a7PH8UnUz8Osg0sdRofPBsYAlfHagms+LTMWBi
         tMnCHTjviyHkvmiVq5atIGC0ESBZShULUe6pcyD3bS/tU/MjmewL4deE5nsQCOMyN8pd
         fKoIb7hcEahFd4hX7Avid0eyGJVPlO2kGOp4CAME+Fwu+Y8gLHgVb6I27Exqr4A5viUf
         Ppi4G73I7Xjz4QYsYZWuniHVcM5DtLB3/hB0P2znSsHqiPWmiZojnDo8U2tlERroydgo
         jSFg==
X-Forwarded-Encrypted: i=1; AJvYcCVk7mVkAnI1GRbAlF78aDXu6PK0pbKKAABhImWfqp/ZBSvdTr7EIwEGSB5BpFy1yPyt0D+Qw/OZtUG04gqx@vger.kernel.org
X-Gm-Message-State: AOJu0YzMtW470H9nOuqvx2277eRtNaDbWm9kiBw+neMBMO6sE2dDzVlM
	GJf5nxmYfaDQLfTF1eOyI+rH2xYii+Og91Y9JddSJxFRUtMaOemoGFzAmWp7+pf1ajOcZpJI8Wf
	NNlvihWYPWYM1HK2boE0v/LQNKV6PoZhuOm9NJKEQ4yu1imzmE/Qaxscv6BN1eWOEssvS
X-Gm-Gg: AY/fxX4hHdJK63e/xYKELhntA/dkn/r5+aySPply7C0+AGbwniJye+aSf9GDMDJTxT5
	eBjdpLO62L8V95K8GVf+9Gy8zXUAFSSZuF6bHGRikpz7OB4VxtDToCQpb7Tc6E08W2g1uTv64p0
	5yoBGB1U29/Dy5eZudKHpvUa4Fm4GrYIkKT+f+Wk/xGn3JH5x3aek5LVGF6QQgO4LSUmmweFWwK
	vVngf/JY6YHnkoRjNa/fBOjdfkTttPaIFQU4qlrXsPU1+Mvt2vmQrv5BiE6637Cga+xS7xoIoj7
	B5CIuZo/+XwpvblDxV/SNwuAdueRoEPGHxsFzdwCZKix1++LnDjkfUSzkgLoBDtmX7RqdzF0qu0
	vBvfJX0wcYvI/qzGg5c+7B8PivAdvuv3PqwyUC/zMX5cMGa+Cqac+xE6FtTCj2+KJXQ==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr25731701cf.8.1766144731943;
        Fri, 19 Dec 2025 03:45:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNtZi1B46d8MS0ItsM14wtH+pq/5YJaUTAUUgWUaWzQOR49pfP65rKPIpGesKt9Onif6HzRA==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr25731391cf.8.1766144731487;
        Fri, 19 Dec 2025 03:45:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm210284666b.67.2025.12.19.03.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 03:45:30 -0800 (PST)
Message-ID: <84be5656-b22e-4fa7-8732-b355ba0c86ed@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface
 support
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
 <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX+VFPiGWYGH5x
 qE/dB4/GoQE4j0SXin8VQd90q2BEJnoj24HSHBECHKZIwUcrtxIryrXj23u0bRgLDDDh9GrUobd
 ae30FXTqQWEAOFmekmxZ4cd66zNlSNhhNsL0li6rj5JTgig1Dw2SRbKM0G0T0sLI5gs2jO1hkRz
 aNTpN5dNG2BPeLweD+hHOvGb2ui51LLr57ntvqXWCNCKj1vjPwzaNGc/6BT68d4JITGDmJurItz
 OZYk2pkxgycu5Ol5zci3i1830HFNsE/XZTiGmukUMCXlbZcjaiTcC8L5cMVJRrRGBfIDhPI823o
 cjnr6gp9aHn43wnE8pDnWJbVCrti/Iux3XakvwY9Z0TbNl1ZvfnZh1jlynEYIIqCpLYM8tzEMjx
 aXkeYXFxFXfmcuiphQxoz3VKEbp58iWbCR2Ed/1LzAiSREQpfayaPosKS5T7SF3WxsqmWvW29xr
 x16vli/FmqJkVIr8uWA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69453adc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=HWOIYEKOvZwOJwrNAaQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: PaHRmQulCzWXlHdCDpGLEXSlyhDBBxv0
X-Proofpoint-GUID: PaHRmQulCzWXlHdCDpGLEXSlyhDBBxv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

On 12/18/25 7:02 PM, Junhao Xie wrote:
> Add infrastructure to support accessing TrustZone-protected storage
> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
> platforms protect their firmware storage (typically SPI NOR flash)
> via TrustZone, making it inaccessible from the non-secure world.
> 
> Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
> validated. Additional platforms can be added as they are tested.
> 
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
>  3 files changed, 233 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 731074ca1ebbe..b117e1b58e363 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
>  	__le64 mem_size;
>  };
>  
> +struct qcom_scm_storage_cmd {
> +	__le64 storage_type;
> +	__le64 slot_num;
> +	__le64 lun;
> +	__le64 guid_ptr;
> +	__le64 storage_cmd;
> +};
> +
> +struct qcom_scm_storage_cmd_details {
> +	__le64 lba;
> +	__le64 length;
> +	__le64 data_ptr;
> +	__le64 data_size;
> +};

Let's make them __packed if only to denote that they're shared structures
(no change to the compiler output because it's n*u64)

[...]

> +#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)

I would vouch for this to be always compiled-in

> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +			      enum qcom_scm_storage_cmd_id cmd_id,
> +			      u64 lba, void *payload, size_t size)

Please align the parameter whitespace (checkpatch, maybe w/ --strict
should point that out)

> +{
> +	struct qcom_scm_res scm_res = {};
> +	struct qcom_scm_desc desc = {};
> +	struct qcom_scm_storage_cmd *cmd;
> +	struct qcom_scm_storage_cmd_details *details;
> +	size_t buf_size;
> +	void *payload_buf;
> +	int ret;

Reverse-Christmas-tree would be neat (it's in a week!)

> +
> +	buf_size = sizeof(*cmd) + sizeof(*details);
> +	if (payload)
> +		buf_size += size;
> +	void *data __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +							 buf_size,
> +							 GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	memset(data, 0, buf_size);
> +	if (payload) {
> +		payload_buf = data + sizeof(*cmd) + sizeof(*details);
> +		memcpy(payload_buf, payload, size);
> +	}
> +
> +	cmd = data;
> +	cmd->storage_type = storage_type;
> +	cmd->storage_cmd = cmd_id;
> +
> +	details = data + sizeof(*cmd);
> +	details->lba = lba;

I'm debating whether adding something like:

struct qcom_scm_storage_payload {
	struct qcom_scm_storage_cmd *cmd;
	struct qcom_scm_storage_cmd_details *details;
	void *data[];
};

would improve readability, but perhaps for just 3 items it's simply not
worth the boilerplate

[...]


> +static int qcom_scm_storage_init(struct qcom_scm *scm)
> +{
> +	struct qcom_scm_storage_info info;
> +	struct platform_device *storage_dev;
> +	int ret;
> +
> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					QCOM_SCM_STORAGE_GET_INFO,
> +					0, &info, sizeof(info));
> +	if (ret < 0) {
> +		dev_info(scm->dev, "scm storage not available: %d\n", ret);
> +		return 0;
> +	}

You can first call __qcom_scm_is_call_available for even more robustness

> +
> +	if (!qcom_scm_storage_machine_is_allowed()) {
> +		dev_info(scm->dev, "scm storage untested, skipping\n");
> +		return 0;
> +	}

FWIW UEFI uses these APIs, so if the implementation is correct, I see no
reason to worry

> +
> +	dev_info(scm->dev, "scm storage size %llu bytes\n",
> +		 info.total_blocks * info.block_size);

dev_dbg?

> +
> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
> +	if (!storage_dev)
> +		return -ENOMEM;
> +
> +	storage_dev->dev.parent = scm->dev;
> +
> +	ret = platform_device_add(storage_dev);
> +	if (ret) {
> +		platform_device_put(storage_dev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
> +					storage_dev);

fauxbus?

> +}
> +
> +#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
> +static int qcom_scm_storage_init(struct qcom_scm *scm)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2449,6 +2626,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Initialize the QTEE object interface. */
>  	qcom_scm_qtee_init(scm);
>  
> +	/*
> +	 * Initialize the SCM storage interface.
> +	 */

/* This fits in a single-line comment */


> +	ret = qcom_scm_storage_init(scm);
> +	WARN(ret < 0, "failed to initialize scm storage: %d\n", ret);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c4..3b68b33c5ccc3 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -149,6 +149,9 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
>  
> +#define QCOM_SCM_SVC_STORAGE			0x1a
> +#define QCOM_SCM_STORAGE_CMD			0x01
> +
>  #define QCOM_SCM_SVC_WAITQ			0x24
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286bf..41f799d8de54f 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
>  	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
>  };
>  
> +enum qcom_scm_storage_cmd_id {
> +	QCOM_SCM_STORAGE_INIT      = 0,
> +	QCOM_SCM_STORAGE_READ      = 1,
> +	QCOM_SCM_STORAGE_WRITE     = 2,
> +	QCOM_SCM_STORAGE_ERASE     = 3,
> +	QCOM_SCM_STORAGE_GET_INFO  = 4,
> +	QCOM_SCM_STORAGE_DEINIT    = 5,

6 -> _MAC_MISMATCH -> EBADMSG? (invalid data hash)
7 -> _ALREADY_RUNNING -> -EALREADY
8 -> _PARTITION_NOT_FOUND -> -ENOENT?
9 -> _READONLY -> -EROFS

> +};
> +
> +enum qcom_scm_storage_type {
> +	QCOM_SCM_STORAGE_NULL    = 0,
> +	QCOM_SCM_STORAGE_SPINOR  = 1,
> +};
> +
> +#define QCOM_SCM_STORAGE_FW_VER_LEN	32
> +#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
> +#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
> +
> +struct qcom_scm_storage_info {
> +	u64 total_blocks;
> +	u32 block_size;
> +	u32 page_size;
> +	u32 num_physical;
> +	u64 manufacturer_id;
> +	u64 serial_num;
> +	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
> +	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
> +	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];

I would strongly assume all variables here are little-endian as well

Konrad


