Return-Path: <linux-arm-msm+bounces-116142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gGtYJPU/R2o6UwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 06:52:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F26D86FE7E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 06:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="l5Qi/bD3";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UZHqLuhC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116142-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116142-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AB683002E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 04:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788C130E85B;
	Fri,  3 Jul 2026 04:51:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760B314B66
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 04:51:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054314; cv=none; b=n2tFzkK38GSXmt6zIRdFa6xduyHHHI4E55Y/PdMik6QLXUB6EGkpTZjQhoWSKeuCig50ER/o8idUMyfhYOcBNxwmk+rvIcdJsLdJmPLwyMCfHMHTlbH+PEppCzBe9is98Txawyb8R5vkEQmWTRQSvoHumx//aVaRFwiGEUDIDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054314; c=relaxed/simple;
	bh=i9VfKxB6W7SE7/7UGu3+PX6t1sBCwGxQEschIHYCu4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcKLHnTXE0Kn3fYNlpq/8pXwiWmx0d8CnpCbDqDZtW2yRRDI6XYzegroZD2RPebkc4gNe6xOWIAE1rIXCAIF/xelu6MD2KGfZmlp4zpEMwqsDWk2UV4SMFJR8s52BC8MB6f2kKz3InHJQCdTpU4ZMJW20bg5ag9j/Cuzj/IuKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5Qi/bD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZHqLuhC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342hIx2687156
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 04:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4woTUuvmZDdwYb7vOc5MfIv0PJgvjUEe4j7hT1Oxb3Y=; b=l5Qi/bD3YIBVa2qu
	/fFhGumHdYQDXQpqtgn/JvqqXNF4wKC3zREQ/65b73aEt3OVmxI/vmYR5YJFaJK4
	JTrZADpaN3GS7IExw0Ep5NiO1Q5WSeRrNjFnTuF74gGplIheVDvO4NlOE/v9MjST
	yZLRdankHJHc0fF+o4yxYs/4DVyG6/sNauqJFraW7I17ZDNctzYhJLu2asjHRNPv
	PsNums7Bm9nvXS6UW+b6NQ66zmBsT6uB1shIl8c2BXQrLKJWUvbzh2VEjYfsTH3A
	griXvcjTiRyuaFHBjcDkKRYnzksNyXIUChCM+w4IkdHuPPj7CYbZ0Vh9542YvVHe
	ILjM8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0fe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:51:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9b71388fbso4192135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 21:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783054302; x=1783659102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4woTUuvmZDdwYb7vOc5MfIv0PJgvjUEe4j7hT1Oxb3Y=;
        b=UZHqLuhCrEu6uv8IOlZOtfhnde0fQ5khuCEv8br692kVla7u1lu2Zh1Vj62c8Alkh6
         +Jj5mIox35re3b1igUBwhev/hAQLwYWvY57Kv0ClDCz6ktbALTgdbLGy4VAedDUQtOD3
         81Hg6GglmveoqjeQYNMHTcnlAcF4jaOeuPOZnJH6qK5WbzaG50P6O+rfVoNOTi4Z4g0+
         B6CPic5a3JrDcto3tT2PzXXmsrRBJpMSdwuGvM7ZDAz0gRc3mnOFphBhakgx3Kp851NY
         9o2zchH35PgCgk7wQixhI+y+o55vLEyCbqj26dF2cNjLkPI1/WhyoGWr3OScy5s3f5Of
         xBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783054302; x=1783659102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4woTUuvmZDdwYb7vOc5MfIv0PJgvjUEe4j7hT1Oxb3Y=;
        b=VGJ/zOJPxALWSFUZpm2UR8hQKADW+Y9m551vn34IzRu3qFQqFjA80CD7by2d04FvhZ
         ibNNO04ohYMB0qm8+vBvjt9MhEP2PTpuBPSjw/Xp7yR9w4daxdUDFVyH39HCrKEz6eP4
         fQ/pru4xtUZ1qjtKmHQytKyEmpmK0q9NtJNfr1hlTmVYCJ0ChJWvwxMFb42kuRb5MyLt
         gJvWFm5QMCRfEhOKarzmb48EQ5vNU3CjWOD6b8iV2TmrPTgzecDZdzjdNBMnu8ApoEp3
         uzXC4/IE9MsZgiVao6IGx6VH7da0pCyeWM3yk9KWlp4WngaBmdv5mNo/uNXZt/QPPpVT
         nQGA==
X-Forwarded-Encrypted: i=1; AHgh+RpePbWVO1k5WwMnY3jaAjFMe2oyHZlbBYRsSXRb8x5oiLnSf1ucjklk0QUg/+f8MvHw2sgabalsXnNzLR8j@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQ790MrwBuXgz1BlkZNd5wzpRdAj2rSSzDoebCsz2AHyUl7hD
	b//Aj4RM+0oJ5JCBlNdKuzMDnhAQmdA4sVuP8Yz+s3uwS3eEZc+Szcb/hrt6TOI4q8i2XVuOJOl
	+CQBa+hKlCImHcjqgkqcbhPzCP+MCQdf/0S7CmFmeY9CwHA6tSVlVwZ34502vVjbosiaD
X-Gm-Gg: AfdE7ck6x+ijsPhtEQcSbIdRlGyMkj2a1FMEDYWPkmsOT6gDHyVvYvPMz8AwNIOHqQb
	dgjRMDlEp25mw3Nh6zF1/bO+Gj+VYnOZKJOCwT39C7SGQG3ARDUn33rcbtZTqpR3KGqszhCaBSd
	LknAlTRAJkNe0oo/fxUU4et8Mmp27w5dax0nJKS7TkGehRjRFBURtGYYXl/lnOvqrvw97uTnfcg
	sh8PVs7LCsmHmKPf2nb6Cs5S/rNwoNcpwcFPzY8DdBpZEbGPRjNcc0Q5PMqaoK1QffhF0+8YNFW
	5HAwYrrszUyaXC8lU2RrzSfo8OMz4eh3tyUPTb0cHwF6UWpkfovgh8ahXNX4UnWfzOiaYTOchKh
	SZNl2E/8exK9NRSWkjH5c5PxCXYceGiTurZzbWKSb+CT+
X-Received: by 2002:a17:902:db12:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2ca7e67eda5mr96601285ad.2.1783054301966;
        Thu, 02 Jul 2026 21:51:41 -0700 (PDT)
X-Received: by 2002:a17:902:db12:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2ca7e67eda5mr96600935ad.2.1783054301351;
        Thu, 02 Jul 2026 21:51:41 -0700 (PDT)
Received: from [10.217.218.209] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa33asm16106814c88.5.2026.07.02.21.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 21:51:40 -0700 (PDT)
Message-ID: <3777cef8-c90a-4c7a-9b71-c563e8d56f2e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:21:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] i2c: i2c-qcom-geni: serve transfers during early
 resume
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        andi.shyti@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorande@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com
References: <20260629134140.755193-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <20260629134140.755193-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0MiBTYWx0ZWRfX0U5ymlFe6A5f
 zyIuS5kguEmNmlzFZUSj8HlRaykUT/h329zhNXPy4qTWkLHnvzTOa+Tzu3jikGDKaM+mQtzOXom
 c0BYS4kdh9lzc+GPB5ojUb8UNHLG73o=
X-Proofpoint-ORIG-GUID: 3koD6LKkVOBIGT_nReO4pA0M4TeHOu7z
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a473fdf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5gi8XA0zxOeqIYz4FXMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3koD6LKkVOBIGT_nReO4pA0M4TeHOu7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0MiBTYWx0ZWRfX5AtlRIFFLspu
 lzsZg53OapNCngl2/t38/joMBwppJvkZHg0o4qVMX/jBPhoFaFqsxYxpE8eJ+9Fb9XKzyLKvEDF
 WC9A38Dhinq6dSqpNb8p88fjm4dTMi/ZLeE7fyBTSXtI+KoP9CqMp3ckPT48s4y0L1hrO6m9sEz
 zFv4cnkbaUtKKOsVtijVuyg/Nod0Zj3fbRLd5XOZld3ZW95knCCnahnw1JKmSPPS62HduE9309u
 TOOZ4FdAO0XQTbYdJCsjZBMbOOpHaCByndWyy2Pcw8HhHP5a2N6U8LDdOrkkLMOpHMGJWWRzMj9
 zVZT2pAFk7jOkAZO7NKdiFuhVZcrGdUqAJ60tX7L2pY+lNsYVUqxKNeTMGrtzSPZbGfGiJcv8Ti
 TydRcopA4sYIDoCabx+5PV5VCE6yN1B5fMI6GT/0hJUj2rqsF+qXmhoQKk2ySpiN4D3eRgn0FG2
 8AqKCGqrFqP0g7Fc2Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116142-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Bjorande@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:url,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F26D86FE7E9



On 6/29/2026 7:11 PM, Mukesh Kumar Savaliya wrote:
> I2C transfers issued during the resume_noirq phase can fail on GENI I2C
> controllers.
> 
> Some devices require I2C communication before their resume sequence can
> complete. One example is a USB Ethernet device attached through PCIe,
> where device configuration must be restored over I2C before PCIe link
> initialization can proceed. Since such accesses occur during
> resume_noirq(), the underlying I2C controller must be able to service
> transfers at that stage.
> 
> However, GENI I2C transfers rely on interrupts for command completion,
> while IRQ handling is still suspended during early resume. Additionally,
> runtime PM may remain disabled until later in the resume sequence, causing
> pm_runtime_get_sync() to return -EACCES and preventing controller
> resources from being enabled.
> 
> Allow the controller to operate during early resume by requesting the IRQ
> with IRQF_NO_SUSPEND and IRQF_EARLY_RESUME so completion interrupts can be
> delivered during the noirq phase. Also restore runtime PM from
> resume_noirq() when it is disabled and tolerate transient -EACCES failures
> from pm_runtime_get_sync() during the PM state transition.
> 
> This enables GENI I2C transfers to complete successfully during the
> resume_noirq phase and allows dependent devices to finish their resume
> sequence.
> 
> Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
> v5->v6 :
> - Modified commit log to start with problem description as suggested by Bjorn.
> - Moved to new implementation of the logic while earlier replied to comments on
>    older design and considers latest fix added recently.
> - Made change generic to I2C including GPI mode transfer, this was not done earlier.
> - Changed email address to oss.qualcomm.com domain.
> Link to V5: https://lore.kernel.org/lkml/20241227130236.755794-1-quic_msavaliy@quicinc.com/
> 
> ---
> v4->v5:
> - Commit log enhanced considering Bjorn's comments by explaining PCIe usecase.
> - Enhanced comment with reason when using pm_runtime_force_resume().
> - Corrected IS_ENABLED(CONFIG_PM) condition inside geni_i2c_xfer().
> - Improved debug log as per Bjorn's suggestions during suspend, resume.
> - Reverted back comment before devm_request_irq().
> Link to V4: https://lore.kernel.org/lkml/bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com/
> 
> ---
> v3->v4 :
>   - Enhanced commit log by explaining client usecase scenario during early resume.
>   - Covered 'usage_count' of 'struct dev_pm_info' under CONFIG_PM to compile non PM CONFIG.
> Link to V3: https://lore.kernel.org/all/20241119143031.3331753-1-quic_msavaliy@quicinc.com/T/
> 
> ---
> v2 -> v3:
>   - Updated exact usecase and scenario in the commit log description.
>   - Removed bulleted points from technical description, added details in free flow.
>   - Used pm_runtime_force_resume/suspend() instead customized local implementation.
>   - Added debug log after pm_runtime_force_suspend().
> Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/
> 
> ---
> v1 -> v2:
>   - Changed gi2c->se.dev to dev during dev_dbg() calls.
>   - Addressed review comments from Andi and Bjorn.
>   - Returned 0 instead garbage inside geni_i2c_force_resume().
>   - Added comments explaining forced resume transfer when runtime PM
>     remains disabled.
> Link to V1: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
> ---
> ---
>   drivers/dma/qcom/gpi.c             |  3 ++-
>   drivers/i2c/busses/i2c-qcom-geni.c | 12 +++++++++++-
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c9a6f610ffd9..332f3aa40628 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -615,7 +615,8 @@ static int gpi_config_interrupts(struct gpii *gpii, enum gpii_irq_settings setti
>   
>   	if (!gpii->configured_irq) {
>   		ret = devm_request_irq(gpii->gpi_dev->dev, gpii->irq,
> -				       gpi_handle_irq, IRQF_TRIGGER_HIGH,
> +				       gpi_handle_irq,
> +				       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
>   				       "gpi-dma", gpii);
>   		if (ret < 0) {
>   			dev_err(gpii->gpi_dev->dev, "error request irq:%d ret:%d\n",
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index d2f5055b0b10..d56b36bd1d26 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -913,6 +913,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>   	gi2c->err = 0;
>   	reinit_completion(&gi2c->done);
>   	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret == -EACCES) {
> +		dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
> +		ret = 0;
> +	}

Why we are checking specific error code here? Why can't we use the below 
error check directly?
if get sync itself is failed with pm runtime disabled then why we are 
going ahead by making ret = 0 here? How you will make sure resources are 
enabled?

>   	if (ret < 0) {
>   		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>   		pm_runtime_put_noidle(gi2c->se.dev);
> @@ -1045,7 +1049,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, gi2c);
>   
>   	/* Keep interrupts disabled initially to allow for low-power modes */
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
> +			       IRQF_NO_AUTOEN | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
>   			       dev_name(dev), gi2c);
>   	if (ret)
>   		return dev_err_probe(dev, ret,
> @@ -1257,7 +1262,12 @@ static int __maybe_unused geni_i2c_resume_noirq(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> +	/* Enforced disable_depth = 0 to actually enable runtime PM during noirq phase */
> +	if (!pm_runtime_enabled(dev))
> +		pm_runtime_enable(dev);

Here we are enabling the pm runtime so where we are disabling it?

> +
>   	i2c_mark_adapter_resumed(&gi2c->adap);
> +
>   	return 0;
>   }
>   


