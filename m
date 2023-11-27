Return-Path: <linux-arm-msm+bounces-2145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF37FA77C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 18:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB850281652
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CD01E51A;
	Mon, 27 Nov 2023 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbZrDH8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BED43C3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 09:06:07 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6cd97c135e8so601439b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 09:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701104766; x=1701709566; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GkynhPafPwOqRqHF5n1O8fkNy/FbkoLc3Yb0KUX9jlU=;
        b=FbZrDH8Y75KE4NAwAXSv0+dEnK9NcR/pbNuWw46ajExInvFDHRoWjBa4t//5iEhGqg
         Mw17QzE7RvoZUAoD/pZlX85xDUlo19HNoKpOIjDJz/i2XQgXhIFJwRa1fWEJdl3UONrC
         Jlk6IarBAew/usJeerSDlF7rBIOh0KCYYNg8IlyOOE6CGnz+yRgx41RpTrPU/UiloZ0e
         pZ+AhaO1ME3NJE2xl6XNxJIh/oDFOQS6trb8cVc4PIF8mzZCMJTG+X6YesIjv0TAq0sz
         cywBG90OAKQAM/XAKBbIKVJxgVQBOCbNf391ZRoIk/4FtWltjNr/O1t9+nRUGgIr6oog
         Ibsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104766; x=1701709566;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkynhPafPwOqRqHF5n1O8fkNy/FbkoLc3Yb0KUX9jlU=;
        b=a9YC1VAaXIj9BMTcPxFqvUQEn6VpWWpm+pFX7XVVkNUWRxMyUVJ0VXJAtt5OX2JZkE
         xoVl5CSUoq0AHMXxRqTJkM5IP9SqEo20VNVcB1OTjrvwXFAu59kA+YJhFtm4BFIKThyY
         kQ/74pIOEUhOuC5F7dRF2ulzw1uVYrGFUTiqYO/d6QGHmnkD3a7fAOj9t+sD+K6LEVwh
         MSL7GThdIry01Fek8KUxZazSDFWtK00dw0l5JozkDtjcNht8roeKWqx/6ordjlWOl5FR
         F1d5aw14OiheKAzjp0ix+3a+KEgFPG5KTVDeGNr+DQ4SdWVRT1iieFcfCnEGwc2TIRhM
         tKjw==
X-Gm-Message-State: AOJu0YxY3TZIx0kvdLd8xErofbEtkTBC3SyN1ZZNvWTR1yd8td5B+HIf
	vI7oM0JBkFNP54QjtGwMJyLfKb5im/Q=
X-Google-Smtp-Source: AGHT+IFyf3QfX74sSFUmAneC52syspupbwDxCKLYXKsrTLuIV2OR08MlsoycA0vyphjChkx0zanxYA==
X-Received: by 2002:a05:6a20:244c:b0:18b:e692:8f01 with SMTP id t12-20020a056a20244c00b0018be6928f01mr10880081pzc.5.1701104766456;
        Mon, 27 Nov 2023 09:06:06 -0800 (PST)
Received: from DESKTOP-6F6Q0LF (static-host119-30-85-97.link.net.pk. [119.30.85.97])
        by smtp.gmail.com with ESMTPSA id gu23-20020a056a004e5700b006cb6fa32590sm7556922pfb.148.2023.11.27.09.06.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 27 Nov 2023 09:06:05 -0800 (PST)
Message-ID: <6564cc7d.050a0220.959c9.1b8b@mx.google.com>
Date: Mon, 27 Nov 2023 09:06:05 -0800 (PST)
X-Google-Original-Date: 27 Nov 2023 12:06:03 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: arielkiaan528@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: **

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AAriel Kiaan		=0D=0ADreamland Estimation, LLC


