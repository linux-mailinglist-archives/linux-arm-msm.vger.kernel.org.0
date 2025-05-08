Return-Path: <linux-arm-msm+bounces-57235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F28AAF64F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 11:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9C39E0FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351BC23D2AE;
	Thu,  8 May 2025 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG9yr+a+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826ED20409A;
	Thu,  8 May 2025 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695161; cv=none; b=TimzDpeFrMPg/rYba9otWkf7VQ9Sa+e9oZtIeJMeRCqhOEw/lOxwya945RiNCK6r042PJIcGL9YwNSMVy3snBK3I+xnovC/5JLaPmiOc/w6cQSkMg+SgZXjSR/DefwA7hGpltOh+VvWJTQ+JwEIcJDIcQq8WhMigiTK6DnU75j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695161; c=relaxed/simple;
	bh=6achUQsWn+DB8/6HkoXFzbxvkFv5PVHCi8xt2j5Sgcg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DVSLWBVrY5L5Bysqrc3RJLiJo76kmDN/V9UImwIsYXFuvgT9iQ1txTFbIYKsgpT9QGhn1fMZypKedaEC7+5F3f6TXN6VdsrX/lJkaJqJnh7/3mOnANbZFEfUMsUgMjWdEu+fXhz1fmp47380NAlYCLi2S4xDvH2IlU/5SQwcEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG9yr+a+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb85ce788so166530066b.3;
        Thu, 08 May 2025 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695158; x=1747299958; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6achUQsWn+DB8/6HkoXFzbxvkFv5PVHCi8xt2j5Sgcg=;
        b=fG9yr+a+9KEH11Kh7B0XVU0wL5Os6iecFs0bv4iYh25/mkgZF5DnBFlLt+T7W3vw80
         KmkLQW8+kqbjUcTdm9TpwF6DyH0jDjnFMcMP5k+2Ksff/oCs9tTrBaUMB4zg3ko/svit
         oLKAFQcxSXpGDT8lmdpaJBygTuen4SXuIembkXok2CSL0y8QdLmDEgHZcaSj3Zj0N+4v
         mZTayAtismliRPKHVd2lIpMhGGab6X02fjOsnJj6LjGH/YVWaMcLzTHL4ZlkmblPFnzl
         P/uwBBlnm7iYlP7u+qCeOMII47so8Da+aTtejKImmiTOvS/MzDIP+lOrquY2EHbPxeaP
         cD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695158; x=1747299958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6achUQsWn+DB8/6HkoXFzbxvkFv5PVHCi8xt2j5Sgcg=;
        b=FyG/B4Wl+rMcvSzhuTOWeHRF9TGGqfoU5fpk82QnXTlLJlgPG8ddaOn4+noTteKs3w
         YLk52dZxlLfZCUTgaGMajffrjFljKITYjdEezaAbcWy3aMJOqVI02RHS5mnGx7cPCF8v
         rzkA5AVGtViAdV3JETTR9GBRE9nAPv67tW/3gUYz1IYHvYiXk5+KiBTahJpmm/qdTwUs
         1v1jqVscmEAjy5ffdMT0+WtZlFmmELemZLUCw6Wj/8lqroR48Sl2nQaTGeIcFwiMnhXA
         o57xyf8NYIdlmb/BvQc6cCNfWsUz9N0vjtbXzsriVMNddxW3lSvu/RuU3VjpdEGJLJVq
         H+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNqB7OZouSnMFWEqCbpu1E1YMNEFNUrB5vbgDs/p+w3/XNTKKHmJQWOg7UCRJPiJCqRe9daYrjxggLDQ==@vger.kernel.org, AJvYcCVBR+q2c7srbLK8QlmxKTcnUYHxcdUHZ6HgblWS0PAPwpHIwhMBDLdKH7TFAnTCiqthvC+0EZuJtxwD5to=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPv/3Vj2DPl8SPzKA2YPnpOscS6HPhUE8NAfn9U5Arh1rKg+K
	M8rLPAchhN5yx90pv2+aVszVRiDItPLggywT5cu1Bd54axV399OT
X-Gm-Gg: ASbGncvx+XmZQmWbHR+PVonsEo+HjewKQttnEwl7ZIDWpfHrMJOjDa6upR5pZDeZjBM
	Cii0eBzol4cGC8h47EEJ5M2tzMYU8z6CsBepVdjlhPJvVN5YcMAphth1JzVlpmSHkGcYjiWyOQc
	i+ebIee7PQQAy4+P0AaPYDbKLwH+bRJO/m1UYRHFnmlkpu6r9xCd95Mzhm4hndfzMPXVC+YOnEh
	z7TF9mV4Y3vDOGO777wLLKDOEeyaKK63zASlpuu34sU7F+6hd0ugb7K4MJSDZMyqEgep0kCeAWU
	6az1jtc3ChUNyHRbRrBhL7lTA7XHvOs7qnqEg9QH3iXDWG0HPqmthg==
X-Google-Smtp-Source: AGHT+IFS+Gj0Na1Pvs++DDiNfGXmaqJZaf4S6YVs2QeojkZ/Be5tVn3O3mur8Faj4gySl9LO1GmznA==
X-Received: by 2002:a17:907:868c:b0:abf:4ca9:55ff with SMTP id a640c23a62f3a-ad1e8c4bf54mr636436066b.32.1746695157432;
        Thu, 08 May 2025 02:05:57 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm1046002766b.1.2025.05.08.02.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:05:57 -0700 (PDT)
Message-ID: <525d2fc8f42db22fe046b7378e32458ffc27f1fe.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] scsi: ufs: qcom: Check gear against max gear in
 vop freq_to_gear()
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, neil.armstrong@linaro.org, 
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Thu, 08 May 2025 11:05:55 +0200
In-Reply-To: <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
	 <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-05-07 at 15:44 +0800, Ziqi Chen wrote:
> The vop freq_to_gear() may return a gear greater than the negotiated
> max
> gear, return the negotiated max gear if the mapped gear is greater
> than it.
>=20
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

