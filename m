Return-Path: <linux-arm-msm+bounces-57129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87AAADC07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 450379A2A0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3239920E005;
	Wed,  7 May 2025 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nMYfWa+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52D20C46F
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611965; cv=none; b=oi5AwhhUXcbEPBiimWLE6+MFzPM/8RJuNJD6Jw1pYwvAvvh3fJbLlGWpUMVzHGCAOLU7gFd9mUx4c4t0J4nKeznF5YR/mH//j+0rXbVMGR9Z4HsNzppuiu/s2UPoX3A5DI8ki84ZT5BQaO/9vIFXYlKPHYYgq2L3DdqCOny/uMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611965; c=relaxed/simple;
	bh=CVOjiks63kN4nyx81zcnv5yZgTHTFsD0uSpOBIumpbQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E7CeP/gZK3h70vQ4IohcIdxEZqaIpsipXl/7a/5/Reht6xPQyec0gTmWE88bvsA24jUXfCvYb7l2qsq6SP036JnOulTi0xP4ohRI5rUqgI8sluFrOooxw7v8YCYEU8vpK30QQqxeQK8wuV34nkhL3+YGJ8T0ECIIRfah+YWbmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nMYfWa+6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace98258d4dso990462166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746611961; x=1747216761; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRBnlzG3csY3q59CrD+HieNRPhlOZlDO/35hP9x7Gow=;
        b=nMYfWa+6GVUJ2BdwZE1phw3EIG0XJ+Q9ZKMBbk9RA6BptuZZhd8r7gPWbRJzFqZ1j0
         ahRnaAH+Uc/dVroauVBs2nJnIYFCDGrM2YU85os6stQB8ieKGKmXTvUJJug1iMX724dp
         WcgzjWHs4NxO58j+ffCnfuWQHEGX+rkEIcO54FE0s6tiXD+gIjNU1mzMlbzsIpKKl49i
         GoW+ljFiwkK558SmCGrs9r3ZNz694BWHIWCbaX5mNCWbYWe5rJQmSO+HsRoNVjfLBE8x
         YYka+lDq8VXpG5QuNdZTLZ2TYQ2qMPQD2CpLPg+dbkJ096T9naQAO+Z19YWDRb89psBj
         QTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746611961; x=1747216761;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRBnlzG3csY3q59CrD+HieNRPhlOZlDO/35hP9x7Gow=;
        b=BOIA/jrdlPhK0L22lqBWFTQW9GG++j06qqhFyA5tZYPnjlk6rpi6P8+q7XmI07ETnw
         LUebWiJrvxzvw1ORNb0ETe/u4UU4bS3ZZz8AIect5GfWh9LXwcMFJUaPt0Nd42XWbe80
         RWgtqp0MkRbaDmsxSKsyt4uz+2VLDfaysRuqMrn3WdqJW2DNZreEe2y+3e+h2LI77ivi
         U98y0iWcfG7rA7Psp6DZSvFQkTmgQYXd03eZivVclhhWJNByOybL0S27lYiFXxC0vmeQ
         +W/rJ15niqAO8oxkOCIoHPZiaFReP9CM+HcMxJ8a3VbhjNwTVrSnKpppFDn70Ea9ysfB
         mbAQ==
X-Gm-Message-State: AOJu0Yw7LWFsGCH0J0lmg5bZP8+hA5CiSJ1/mXn0QEOqPP2QvGMBAEWB
	NRPsGFJShbAQeYfbvqRv973cODJbVtZ6Jk6jUQkYDbMyTxgZr0GQkyXlQqXfEiI=
X-Gm-Gg: ASbGncurOs31l1NsEwDF9GE5WfcPx57q5mzEX5cZlDmY+PcUiS/U9z/5ichNPaxrR7s
	Fr9m/JLs3f9W9ihAjDPNYG41HuDt2gjVtQaXF0/FO2ZoQNqwckbYGW4ylyea/CEGR2VMp92aqrX
	sxTvcu2MpmginWRGbrpqh4iLyvO3LOm/OJ18WjAS395WhgszGBwP0MzKP+3y5LAAcugoP5Uqk7x
	8DaLRJuAJ0PTlRMmVT+ZfynnaHZmctTY530xhtpDIbyg+SJnjO6LcJWtCXOphqKWAO6Q9W7W1K5
	Wwrj8ECEpiAOcRN1hRWYaLmJSbiAVQVhOcTgojBLzuJnlsGdmo/8dq6Xlgb7VNDGxFEFnHVq7aU
	R7T8MGsOrXw==
X-Google-Smtp-Source: AGHT+IETi13rF9ppf4Lq9nZexKfgosA14aFfsxFA6IPZoLnGnfZ4smw0IgYrqh4falCvDOZVHa7FtA==
X-Received: by 2002:a17:907:9814:b0:ad1:8dde:5b7a with SMTP id a640c23a62f3a-ad1e8d055a7mr240311766b.43.1746611961036;
        Wed, 07 May 2025 02:59:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891490afsm874478866b.23.2025.05.07.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 02:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 11:59:19 +0200
Message-Id: <D9PU9LEA7CLT.37IBLZRP90E9S@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
 <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
 <D9PS51XVRKLP.1AHMCRH9CZFWU@fairphone.com>
 <7c74a395-a8b8-4a12-9ddb-691f28c90885@quicinc.com>
In-Reply-To: <7c74a395-a8b8-4a12-9ddb-691f28c90885@quicinc.com>

On Wed May 7, 2025 at 11:09 AM CEST, Ziqi Chen wrote:
> Hi Luca,
>
> On 5/7/2025 4:19 PM, Luca Weiss wrote:
>> Hi Ziqi,
>>=20
>> On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
>>> From: Can Guo <quic_cang@quicinc.com>
>>>
>>> On some platforms, the devfreq OPP freq may be different than the unipr=
o
>>> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it t=
o
>>> find the unipro core clk freq.
>>>
>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>> ---
>>>   drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++----=
-
>>>   1 file changed, 71 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>> index 7f10926100a5..804c8ccd8d03 100644
>>> --- a/drivers/ufs/host/ufs-qcom.c
>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>  =20
>>> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba=
,
>>> +												   unsigned long freq, char *name)
>>> +{
>>> +	struct ufs_clk_info *clki;
>>> +	struct dev_pm_opp *opp;
>>> +	unsigned long clk_freq;
>>> +	int idx =3D 0;
>>> +	bool found =3D false;
>>> +
>>> +	opp =3D dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>>> +	if (IS_ERR(opp)) {
>>> +		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", fr=
eq);
>>=20
>> I'm hitting this print on bootup:
>>=20
>> [    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact f=
requency 18446744073709551615
>> [    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact f=
requency 18446744073709551615
>>=20
>> Doesn't look like it's intended? The number is (2^64 - 1)
>>=20
> Yes, this is expected. During link startup, the frequency
> ULONG_MAX will be passed to ufs_qcom_set_core_clk_ctrl() and
> ufs_qcom_cfg_timer(). This frequency cannot be found through the API
> dev_pm_opp_find_freq_exact_indexed(). Therefore, we handle the
> frequency ULONG_MAX separately within Ufs_qcom_set_core_clk_ctrl()
> and ufs_qcom_cfg_timer().
>
> This print only be print twice during link startup. If you think print
> such print during bootup is not make sense, I can improve the code and
> update a new vwesion.

I'll let others comment on what should happen but certainly this large
number looks more like a mistake, like an integer overflow, if you don't
dig into what this number is supposed to represent.

Perhaps an idea could be to just skip the print (or even more code) for
ULONG_MAX since an opp for that is not supposed to exist anyways?

I didn't check the code now but for other frequencies this would be an
actual error I imagine where it should be visible.

Regards
Luca

>
> BRs.
> Ziqi
>
>> Regards
>> Luca
>>=20


