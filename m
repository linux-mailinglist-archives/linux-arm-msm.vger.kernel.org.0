Return-Path: <linux-arm-msm+bounces-87604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C349CF67A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D0E63011426
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8277171CD;
	Tue,  6 Jan 2026 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzSG4IT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScPHdq6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE31D5178
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767666766; cv=none; b=FvrMatQ4aqY7gc85ihMmmH9XS1EKlrdafdtRViVcXSXdv0W6cRV19AKAeQ/AB/QYh8y1C248b/5dDaAPWMLUHwcHX59+XlJ9kWcP3nzEuRtD3H45UWdWT99LhII3ZO5sABLqjhKaMgrr4SAA4V29ldyHOnSM1RVJUOPaRx9wcNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767666766; c=relaxed/simple;
	bh=s4HXUfnKrGF3YOBo4t33gEiLCHQphx23M+E7PPgmudU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzwV8Xi0V48X0UUQL/TgNg1haEhiBUuMl9J1+jv2s7FjFiX5zRDDo3FlKdX6l+8aGUgBb5rk8ZUSxFxK6C+OHVBfz/ZX7OlQXTJJI9HDq1thb1vlZuuSC8VHVRtFVr7o+yQSPLyj/uVGKV3bUcdmRGpmpwdr0qlqPDWeyW8BG/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzSG4IT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScPHdq6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nMGY2886467
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4HXUfnKrGF3YOBo4t33gEiLCHQphx23M+E7PPgmudU=; b=bzSG4IT9BwiRiTrn
	SBPW4eGCCMjvFe4vyeoe2YXINVCaHozIfsgkveJpT5emfjh5Q2QK8EjQsYYxbGVy
	LwIDe9a/BeiGQwiTFHT7vECIyTH4jpUVRetX5heFd3XG/ElRfDGv+yxs9bLv2rH8
	NsJzpU91kMNbJlrVASKSFdPypE/0aa9ffxl9n/ruIuVcgWyPloFO8xbh9+QbKLLR
	OhFdAr7VF5zql0GtyrT47tn4bjjXGPcupcf2uLGWWsdGabL5wUlW76kzr/55hAHu
	TC2uoATuMpVj8UDSVIJSzTZg0hHqXss5vt4BUAopDxDXEKtdxlb3weHjHTz42IbI
	XuCIFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd8e5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:32:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso1277369a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767666763; x=1768271563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4HXUfnKrGF3YOBo4t33gEiLCHQphx23M+E7PPgmudU=;
        b=ScPHdq6QG/uoGGeMDY25Eu+ZoWUX+q7meLUGHUTZlj6h0qVgziPwDDlUcMI4T6QIjr
         P0kz+5G/vTB3StzajrgAJOcMKJhAlHRPdvtmDYBvJ2WYUsb4702FoBXvlk44qCzbdUvS
         Un+c277reYxOAI4/PkOayjVWLQBG1WY6Nk61rLRXbZjtxxnQPyLXmgxQ8uow00Px6/4Y
         L2ll+nTknMHf5PufplumDtgBg9pWE01WpgkiPDm+W9G5sX2m3M+qKD2+NI7oWMAnFnTb
         oaOx9O4H1vWiaqjF9/XJ8GpZsyxVxtTpbFRPeH6q9MkvKvMYB0XIE1udj1KqMBmz+dN5
         C9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767666763; x=1768271563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4HXUfnKrGF3YOBo4t33gEiLCHQphx23M+E7PPgmudU=;
        b=NxBL5KBk/m43ZAMglUKxKTQX77t9m42yl8UIQC6TprTI9C61t88vH3ANFRyycWcJEN
         GvwuRXYnlSq6pfhwLANta1RPoQaKsX4HGZ/SRquNIHgVzOnslrl76pV24nZ5wLXss9f/
         tvxwrlyYauiRGsSbJaNricqcymWlLSiwfhQaD9bGE3NndO8iqcpcKiY6VsEy2ftG+tuD
         ftqFUM8G8IT+17tbzh4x1qdtjNQ/mPv5Gsj9Tpfyh4GwU46vX8Nx7ml4IjGr2WOaGg1J
         Dz51Dja+sMnSmmlXi4WvVMElZ7PeA0IOJG8XXePI9Gkl4xG19vIq4ao0vVSONsRUXXqL
         +UNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTPrla2NB8pCX43jD/jLDxZvTagzDI4K5mnUXIwh7wHigQ+4FKp+ILdF8+IRrbGayAmuxiug+S10OZMMfd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlf6JXjbm3uS0cHj7LSz1ztwUyPXhAkuvj+LtMw3yfDqNZGBRB
	DKkbMTcNVW7WuRuKNawPMZl8fu6DcnW6VKbMOMyHpnoe3voYMqGQZfTl2IKAdFJY+QwAeLOQouf
	xyHhNQPIVCEG7/rSE7AORH6ANfyIcLmUqzrqs7PMfZcIyxaARlMdSn6p32S/7JZgWFXkB7FpSRn
	3HtA9YgShPZNXuWNMCpSl5Z7h1W5JlL2EoCD0IQ2Xe0b0=
X-Gm-Gg: AY/fxX5b/gHTq/xH6vORMan0UFJs2aRVNGW7veRYzlPw5e44bS2hRb+1Xo3axE1TODC
	Xs07FkFfuxqKG58Yod3oCeMWaDtYX1zncn3f5ygUsQjFpd7x/mZi6lSZJYbT1ZMnL1R1mA9mSCj
	Ke5F9ABWtVLIVTgFmk/myX8epdblSm6UPxV5YVu6Q2grwo9bmeuueeuVh7SbCdtEA=
X-Received: by 2002:a05:6a21:999a:b0:35e:6c3:c8d6 with SMTP id adf61e73a8af0-389823cc871mr1213851637.41.1767666763078;
        Mon, 05 Jan 2026 18:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE822MAVam3mO83RTpLVRchdqJZM8HdniMKKqr3nM7fWL25KjYQMNHpKNlUxiVKAJbA3CvWiz0QNdnA/bA4/dM=
X-Received: by 2002:a05:6a21:999a:b0:35e:6c3:c8d6 with SMTP id
 adf61e73a8af0-389823cc871mr1213821637.41.1767666762506; Mon, 05 Jan 2026
 18:32:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
 <tfdeucc7opjtjuo723hskens3te3eg5ohm7db6tbhompbtgkkq@vsqgz5qtmbr2> <6d29459c-2cd8-44ed-b64f-6947cf620960@oss.qualcomm.com>
In-Reply-To: <6d29459c-2cd8-44ed-b64f-6947cf620960@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 04:32:31 +0200
X-Gm-Features: AQt7F2qsD_5aiYnuBf2iYsBOnBnMF18rt1i42DaXK9XOw3KfDRAywDzf-EqORBQ
Message-ID: <CAO9ioeVCRF1ADsrXeHzP7hKoudvMQ1f6cZPDx5jt_8C7SLmYZQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/1] Bluetooth: btqca: move WCN7850 WA
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mgrTgecpYRT7GeNl2cIZL9W2EDr7J5Xh
X-Proofpoint-GUID: mgrTgecpYRT7GeNl2cIZL9W2EDr7J5Xh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMCBTYWx0ZWRfX89pcnXDGc4+H
 4Gag5Ste4oqgKy95LYbDqZFGkPWy7Cddzz+s6hwOpobm+sFoNEhkwLtH9kp/A+NeKCBNSD/5uhN
 68NCyFDVFVYmvLZ0sAkY2zVkdE82bpGr94XTjLN7I91A/S8Exo12RI7TcnhrXePpZFGqs/8IljK
 vQaBk3qAQga0mkrtGdXAsRoHCFUPnTA8qdksU7Kmawh5we7DbMOtr4u3Dvffu9WOrsDcby/2VI5
 gAtc2M7UYUMsUx0O+xqIr6o+/kjf1uk9xCIgTU5qNMZECWOpnEeFRq7l7sf5rBmGscc1QiQZU9Q
 ms83b69S5VTp1thgMieX79cJoxuvhtqCaA2ajqSdVsiOce513QlB/tzFn82m4av2OZM4ZZML/7x
 JdVl7JrGp7NF113q19jked+RcBJV4bf0wTk0FS18o9NmJZuNePGOGtu6WQHnEoAdxPV1rJVbx9Y
 mbUCcLE4l7SnWwkW4cA==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695c744c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XPMivCli0LKV4eIUGI8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060020

On Tue, 6 Jan 2026 at 04:21, Shuai Zhang <shuai.zhang@oss.qualcomm.com> wro=
te:
>
> Hi Dmitry
>
> On 1/6/2026 10:16 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 06, 2026 at 10:07:37AM +0800, Shuai Zhang wrote:
> >> Move WCN7850 workaround to the caller
> > Why have you lost the second patch?
>
>
> I thought the second one had already been reviewed, so I didn=E2=80=99t n=
eed to
> submit it.
>
> Do I need to submit a new version that includes both patches?

How else would it be merged if it is not submitted in the latest
version of the series?
Have you read Documentation/process/ ? Especially submitting-patches.rst?


--=20
With best wishes
Dmitry

