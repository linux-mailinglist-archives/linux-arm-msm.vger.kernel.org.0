Return-Path: <linux-arm-msm+bounces-49086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E9A41275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 01:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32271701E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 00:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B72E8F54;
	Mon, 24 Feb 2025 00:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EK/Tzhxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517F1E487
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356355; cv=none; b=DEHAaLOZgrB0yxyf+Tu3XHYzS7dnrk6vaphRoL96gmsoRs+udurcFo9qFHjTtE7KBDphPJFUXN5TAlgW1qbWvESBGQTKis0SD0djet2xmVSthcYsBgrSHxx8IzG1wlXmk//kWjJQpkH9c12CIQ/sjWkNenzSjmgSeRFWQBJg/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356355; c=relaxed/simple;
	bh=TvIMU489tU78+Iqy04G/wuH4oWe4j+s+mPGK7k5dEH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egj+GlBs+l5klECMd29KwsrThGEApLPB6aQ+o+sL7waOZ8LAxJiwnm1vI3r4ITP1loHATxKjiV3ofZR+0Ri9GENZOGQugYE8tA2ujcrpusNmmn+a3QYSkwxe7FlDCDT67qiwG6zIS8h72FS/DsH34FzxP+QqjaEGEmmistMKeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EK/Tzhxb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5462ea9691cso4260370e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356352; x=1740961152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFHN1wB7hAg3BDNRXM4so5q/WzeCPLIz2eBiXH9F1QM=;
        b=EK/TzhxbYtAsKJY3tSqvhgqzZ6rU+4c0mfvY54KhUR/jrEjs32WJ1XvEqyls1W2xBu
         fwqA0kgy2vaFCSPVTHPvzRaftiQHJ1ncDiTS5d92d/EX+Axl7iLoBuTWlhxZPLCxtREo
         mriiwxAa675vD5kgbzr49Q6trTTyjW4IF0QOgnJBi0NWFs/QkTUG7CA+F4JxlkvrWpgs
         pXY+xqnROVn7Mcc4RryRzGVtq5GwkoK3eN9KJRbNwGIRjvXqufabRG9DuHwFm26Rt5n1
         x9vrntVIYzBfelXkgvBjmwSQ7eg0h+Qx2qM9QhCEksLCGGgfpK4uAADhvrknBfDAGWZm
         DbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356352; x=1740961152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHN1wB7hAg3BDNRXM4so5q/WzeCPLIz2eBiXH9F1QM=;
        b=h+FfR+tbr05bJ4nXVfkkkRVFq6d6D/Tqb/NlyslHJNXikNvL0T2wvzUPTGRvBq5Dhh
         sCupKboKmoQOy18oNO99vv+rM+Mhoy/YjryTDQXY+M6EBICboPKn7LyvuLKAt0M+q8I5
         LFKXnT94wvbvg2nQapXri614uW4pf1XUUBgxdsWOF4aoSldpm+y9fL+q8AjzhtKm9x2G
         1rliMHmyPSuVg71YnYAAyyDlN8i+v0F0J1+VTRUmN9LMx178UUUQcQG9BB2Pz7gZAxxt
         v0jwYWdH08mNHVCet4TlMVK3nPdOFfJzEis/PxLv3MTYV+/ZyiTVf51GxjZHoT7vr4MP
         6gRw==
X-Forwarded-Encrypted: i=1; AJvYcCXW053zycqEbO76dGe3KDni1/rYrcDG2WHyJt2GB2iuQHOQnqNI7iWwa1BlTJQP52Q8LGKVobGyrNC1nKQX@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsEsd+iVH8oD49VY8dX1qg5z5pHwX3ntoySHc6oKzOXAQ6yIO
	6MqPvpR3cP8CWXqvz5/5BXDf4VS59JhQWgw5XuZ+xqw8GRNv4SnJpqHrUs85ajc=
X-Gm-Gg: ASbGncv49hmjFE/zRFPda1ADJTGn3iSvZ6I/wtFh/A/UDgfpMgDIrd2vos5Odl3cVUg
	8MBSDmwHSMyykjNY331KhOVGkU6JOxfv63jPAm5D4PL1Alc5fzA2h2F4KD1MfpQrjUfd0J3HdYY
	9zL7yNd0WyBmjazBnb76mj0sM5rtDNKxb1bpRuJqbtggptbZ3nyuW2MtXeixwdFCmXwFHE2sUTP
	Es4kHTdou/XQp+S7FD/Yqi0VQDvs0DYjVbxm+yBwdjNXHWJpkRIsosWlO0r2+YzFQ96wDd2o8C7
	ARtK+nEaohH/ltbjz0Be9pxsgpzfkvm2H1+jJcNbdm+Ci2f0oQY/bLksvyoSlyeHLD0zSwMj57W
	B6JDAgQ==
X-Google-Smtp-Source: AGHT+IEt89JxR/uYuIfY1ZBQGBkgrhGrFGK4rZ9JZp9Dr7u/koPyxNo3xVk8Uth1LpOxlXP3HFhAIg==
X-Received: by 2002:a05:6512:2252:b0:545:3032:5fd4 with SMTP id 2adb3069b0e04-54838edd854mr5253178e87.11.1740356351934;
        Sun, 23 Feb 2025 16:19:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2e03ef65sm23787381fa.73.2025.02.23.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:19:10 -0800 (PST)
Date: Mon, 24 Feb 2025 02:19:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm632-fairphone-fp3: Move status
 properties last
Message-ID: <qgxtu6quxz2ca7old7mau7rjk3kbhwth4ic4mov6r2fefmpq7w@avznusgv2f3p>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-1-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-1-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:47PM +0100, Luca Weiss wrote:
> As is common style nowadays, move the status properties to be the last
> property of a node.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

